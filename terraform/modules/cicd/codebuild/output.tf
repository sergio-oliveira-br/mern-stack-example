# terraform/modules/cicd/codebuild/output.tf

output "project_arn" {
  value = aws_codebuild_project.this.arn
}
