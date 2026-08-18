# terraform/modules/igw/variable.tf

variable "vpc_id" {
  type        = string
  description = "VPC ID where the IGW will be attached"
}

variable "name" {
  type        = string
  description = "Internet Gateway name"
}
