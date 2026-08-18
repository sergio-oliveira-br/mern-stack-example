# terraform/modules/subnets_public/variable.tf

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "cidr_block_a" {
  type        = string
  description = "CIDR of public subnet A"
}

variable "cidr_block_b" {
  type        = string
  description = "CIDR of public subnet B"
}

variable "az_a" {
  type        = string
  description = "Availability Zone of public subnet A"
}

variable "az_b" {
  type        = string
  description = "Availability Zone of public subnet B"
}

variable "name" {
  type        = string
  description = "Prefix for naming subnets"
}
