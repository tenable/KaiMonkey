output "private_subnet" {
  value = aws_subnet.km_private_subnet.*.id
}

output "vpc_id" {
  value = aws_vpc.km_vpc.id
}

output "target_lb_group_id" {
  value = aws_lb_target_group.km_lb_target.id
}

output "target_lb_security_group" {
  value = aws_security_group.km_alb_sg.id
}

output "elb_url" {
  value = "http://${aws_lb.km_lb.dns_name}"
}