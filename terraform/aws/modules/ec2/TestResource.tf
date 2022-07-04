
 #text

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
  ingress_cidr_blocks = ["0.0.0.0/16"]
  tags = {
    Name = "ExampleAppServerInstance"
  }
  
resource "aws_instance" "app_server11" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
  monitoring = var.monitoring
  ingress_cidr_blocks = ["0.0.0.0/16"]
  tags = {
    Name = "ExampleAppServerInstance"
  }

