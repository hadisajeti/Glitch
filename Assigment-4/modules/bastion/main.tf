module "vpc" {
  source = "../vpc"
}
resource "aws_security_group" "bastion-sg" {
  name        = "bastion-security-group"
  description = "Security group for the EC2 instance"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "bastion_host" {
  ami           = var.bastion_ami
  instance_type = "t2.micro"
  subnet_id     = module.vpc.private_subnet_id 
  vpc_security_group_ids = [aws_security_group.bastion-sg.id]

  tags = {
    Name = "BastionHost"
  }
}