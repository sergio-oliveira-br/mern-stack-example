# terraform/modules/subnets_public/main.tf

resource "aws_subnet" "public_a" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidr_block_a
  availability_zone       = var.az_a
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.name}-public-a"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidr_block_b
  availability_zone       = var.az_b
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.name}-public-b"
  }
}
