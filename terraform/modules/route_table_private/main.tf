# terraform/modules/route_table_private/main.tf

resource "aws_route_table" "this" {
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.name}-private-rt"
  }
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.this.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.nat_id
}

resource "aws_route_table_association" "private_a" {
  subnet_id      = var.private_subnet_a
  route_table_id = aws_route_table.this.id
}

resource "aws_route_table_association" "private_b" {
  subnet_id      = var.private_subnet_b
  route_table_id = aws_route_table.this.id
}


