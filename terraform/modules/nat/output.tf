# terraform/modules/nat/output.tf

output "id" {
  value       = aws_nat_gateway.this.id
  description = "NAT Gateway ID"
}

output "eip" {
  value       = aws_eip.this.public_ip
  description = "Elastic IP associated with the NAT Gateway"
}
