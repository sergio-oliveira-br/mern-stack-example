# terraform/modules/cicd/codebuild_deploy/variables.tf

variable "project_name" {
  type        = string
  description = "Deploy CodeBuild project name"
}

variable "artifact_bucket" {
  type        = string
  description = "S3 bucket where CodePipeline saves build_output"
}

variable "service_role_arn" {
  type        = string
  description = "IAM role ARN used by CodeBuild"
}
