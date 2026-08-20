# terraform/modules/cicd/codecommit/output.tf

output "clone_url" {
  value = aws_codecommit_repository.this.clone_url_http
}
