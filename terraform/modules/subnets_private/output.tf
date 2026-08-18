# terraform/modules/subnets_private/output.tf

output "private_a_id" {
  value = aws_subnet.private_a.id
}

output "private_b_id" {
  value = aws_subnet.private_b.id
}

output "private_ids" {
  value = [
    aws_subnet.private_a.id,
    aws_subnet.private_b.id
  ]
}
