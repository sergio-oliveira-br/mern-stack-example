# terraform/modules/route_table_public/main.tf

resource "aws_route_table" "this" {
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.name}-public-rt"
  }
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.this.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.igw_id
}

resource "aws_route_table_association" "public_a" {
  subnet_id      = var.public_subnet_a
  route_table_id = aws_route_table.this.id
}

resource "aws_route_table_association" "public_b" {
  subnet_id      = var.public_subnet_b
  route_table_id = aws_route_table.this.id
}
