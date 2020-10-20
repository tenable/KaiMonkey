data "aws_availability_zones" "available" {}

# Create a VPC to launch our instances into
resource "aws_vpc" "km_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(var.default_tags, {
    Name = "km_vpc_${var.environment}"
  })
}

# Create an internet gateway to give our subnet access to the outside world
resource "aws_internet_gateway" "km_ig" {
  vpc_id = aws_vpc.km_vpc.id

  tags = merge(var.default_tags, {
    Name = "km_ig_${var.environment}"
  })
}

# Grant the VPC internet access on its main route table
resource "aws_route" "km_route" {
  route_table_id         = aws_vpc.km_vpc.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.km_ig.id
}

resource "aws_subnet" "km_private_subnet" {
  count             = var.az_count
  cidr_block        = cidrsubnet(aws_vpc.km_vpc.cidr_block, 8, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  vpc_id            = aws_vpc.km_vpc.id

  tags = merge(var.default_tags, {
    Name = "km_private_subnet_${var.environment}"
  })
}

# Create var.az_count public subnets, each in a different AZ
resource "aws_subnet" "km_public_subnet" {
  count                   = var.az_count
  cidr_block              = cidrsubnet(aws_vpc.km_vpc.cidr_block, 8, var.az_count + count.index)
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  vpc_id                  = aws_vpc.km_vpc.id
  map_public_ip_on_launch = true

  tags = merge(var.default_tags, {
    Name = "km_public_subnet_${var.environment}"
  })
}

# Create a NAT gateway with an EIP for each private subnet to get internet connectivity
resource "aws_eip" "km_eip" {
  count      = var.az_count
  vpc        = true
  depends_on = [aws_internet_gateway.km_ig]

  tags = merge(var.default_tags, {
    Name = "km_eip_${var.environment}"
  })
}

resource "aws_nat_gateway" "km_nat_gateway" {
  count         = var.az_count
  subnet_id     = element(aws_subnet.km_public_subnet.*.id, count.index)
  allocation_id = element(aws_eip.km_eip.*.id, count.index)

  tags = merge(var.default_tags, {
    Name = "km_nat_gateway_${var.environment}"
  })
}

# Create a new route table for the private subnets
# And make it route non-local traffic through the NAT gateway to the internet
resource "aws_route_table" "km_route_table" {
  count  = var.az_count
  vpc_id = aws_vpc.km_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = element(aws_nat_gateway.km_nat_gateway.*.id, count.index)
  }

  tags = merge(var.default_tags, {
    Name = "km_route_table_${var.environment}"
  })
}

# Explicitely associate the newly created route tables to the private subnets (so they don't default to the main route table)
resource "aws_route_table_association" "km_private_route_table_association" {
  count          = var.az_count
  subnet_id      = element(aws_subnet.km_private_subnet.*.id, count.index)
  route_table_id = element(aws_route_table.km_route_table.*.id, count.index)
}

### Security

# ALB Security group
# This is the group you need to edit if you want to restrict access to your application
resource "aws_security_group" "km_alb_sg" {
  name        = "km_alb_sg_${var.environment}"
  description = "controls access to the ALB"
  vpc_id      = aws_vpc.km_vpc.id

  ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.default_tags, {})
}

# Traffic to the ECS Cluster should only come from the ALB
resource "aws_security_group" "km_ecs_sg" {
  name        = "km_ecs_sg"
  description = "allow inbound access from the ALB only"
  vpc_id      = aws_vpc.km_vpc.id

  ingress {
    protocol        = "tcp"
    from_port       = "80"
    to_port         = "80"
    security_groups = [aws_security_group.km_alb_sg.id]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.default_tags, {
    Name = "km_ecs_sg_${var.environment}"
  })
}

resource "aws_lb" "km_lb" {
  name            = "km-lb-${var.environment}"
  subnets         = aws_subnet.km_public_subnet.*.id
  security_groups = [aws_security_group.km_alb_sg.id]
}

resource "aws_lb_target_group" "km_lb_target" {
  name        = "km-lb-target-group-${var.environment}"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.km_vpc.id
  target_type = "ip"
  depends_on = [ aws_lb.km_lb ]
}

# Redirect all traffic from the ALB to the target group
resource "aws_lb_listener" "km_frontend_listener" {
  load_balancer_arn = aws_lb.km_lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_lb_target_group.km_lb_target.arn
    type             = "forward"
  }
}