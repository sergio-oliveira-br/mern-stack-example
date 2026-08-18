# terraform/modules/vpc/variables.tf

variable "cidr_block" {
  type        = string
  description = "VPC CIDR "
}

variable "name" {
  type        = string
  description = "VPC Name"
}
