# terraform/modules/cicd/codebuild_deploy/output.tf

output "project_name" {
  value = aws_codebuild_project.this.name
}

output "project_arn" {
  value = aws_codebuild_project.this.arn
}
