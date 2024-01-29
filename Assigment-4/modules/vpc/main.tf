resource "aws_vpc" "my_vpc" {
  cidr_block = var.cidr_block
  enable_dns_support  = true
  enable_dns_hostnames = true
  tags = {
    Name = "my-vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.public_subnet_cidr
  availability_zone =  "${"eu-central-1"}a"

  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.private_subnet_cidr
  availability_zone = "${"eu-central-1"}b"

  tags = {
    Name = "private-subnet"
  }
}