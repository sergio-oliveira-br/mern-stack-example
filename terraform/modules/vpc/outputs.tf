# terraform/modules/modules/vpc/outputs.tf

output "id" {
  value       = aws_vpc.this.id
  description = "VPC ID created"
}
