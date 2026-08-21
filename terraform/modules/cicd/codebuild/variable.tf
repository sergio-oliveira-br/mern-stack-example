# terraform/modules/cicd/codebuild/variable.tf

variable "project_name" {
  type        = string
  description = "Project name CodeBuild"
}

variable "repository_url" {
  type        = string
  description = "CodeCommit repository URL"
}

variable "service_role_arn" {
  type        = string
  description = "IAM role ARN used by CodeBuild"
}

variable "cluster_name" {
  type        = string
  description = "Cluster name EKS"
}
