# terraform/modules/subnets_private/variable.tf

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "cidr_block_a" {
  type        = string
  description = "CIDR of private subnet A"
}

variable "cidr_block_b" {
  type        = string
  description = "CIDR of private subnet B"
}

variable "az_a" {
  type        = string
  description = "Availability Zone of private subnet A"
}

variable "az_b" {
  type        = string
  description = "Availability Zone of private subnet B"
}

variable "name" {
  type        = string
  description = "Prefix for naming subnets"
}
