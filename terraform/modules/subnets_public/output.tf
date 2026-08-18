# terraform/modules/subnets_public/output.tf

output "public_a_id" {
  value = aws_subnet.public_a.id
}

output "public_b_id" {
  value = aws_subnet.public_b.id
}

output "public_ids" {
  value = [
    aws_subnet.public_a.id,
    aws_subnet.public_b.id
  ]
}
