# terraform/modules/igw/output.tf

output "id" {
  value       = aws_internet_gateway.this.id
  description = "Internet Gateway ID"
}
