# terraform/modules/route_table_private/variables.tf

variable "vpc_id" {
  type = string
}

variable "nat_id" {
  type = string
}

variable "private_subnet_a" {
  type = string
}

variable "private_subnet_b" {
  type = string
}

variable "name" {
  type = string
}
