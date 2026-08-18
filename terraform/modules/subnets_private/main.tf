# terraform/modules/subnets_private/main.tf

resource "aws_subnet" "private_a" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidr_block_a
  availability_zone       = var.az_a
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.name}-private-a"
  }
}

resource "aws_subnet" "private_b" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidr_block_b
  availability_zone       = var.az_b
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.name}-private-b"
  }
}
