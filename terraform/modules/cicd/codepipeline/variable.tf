# terraform/modules/cicd/codepipeline/variable.tf

variable "pipeline_name" {
  type        = string
  description = "CodePipeline name"
}

variable "artifact_bucket" {
  type        = string
  description = "S3 bucket to store pipeline artifacts"
}

variable "codecommit_repository_name" {
  type        = string
  description = "CodeCommit repository name used in stage Source"
}

variable "codecommit_branch" {
  type        = string
  description = "Branch of CodeCommit used in stage Source"
  default     = "main"
}

variable "codebuild_project_name" {
  type        = string
  description = "Project CodeBuild responsible for building the image"
}

variable "codebuild_deploy_project_name" {
  type        = string
  description = "Project CodeBuild responsible for the deployment in EKS"
}
