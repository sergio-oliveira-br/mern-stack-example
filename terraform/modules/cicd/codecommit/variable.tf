# terraform/modules/cicd/codecommit/variable.tf

variable "repository_name" {
  type        = string
  description = "Name of the CodeCommit repository"
}
