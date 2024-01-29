module "vpc" {
  source = "../vpc"
}

resource "aws_security_group" "rds_sg" {
  name        = "rds-security-group"
  description = "Security group for the RDS instance"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}