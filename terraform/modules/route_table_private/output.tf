# terraform/modules/route_table_private/output.tf

output "id" {
  value = aws_route_table.this.id
}