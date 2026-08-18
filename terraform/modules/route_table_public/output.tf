# terraform/modules/route_table_public/output.tf

output "id" {
  value = aws_route_table.this.id
}
