# terraform/modules/cicd/codecommit/main.tf

resource "aws_codecommit_repository" "this" {
  repository_name = var.repository_name
  description     = "MERN application repository for CI/CD via CodePipeline"
}