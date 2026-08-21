# terraform/modules/cicd/codepipeline/output.tf

output "pipeline_name" {
  value       = aws_codepipeline.this.name
  description = "Nome do CodePipeline"
}

output "pipeline_arn" {
  value       = aws_codepipeline.this.arn
  description = "ARN do CodePipeline"
}
