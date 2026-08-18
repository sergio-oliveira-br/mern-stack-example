# terraform/modules/route_table_public/variable.tf

variable "vpc_id" {
  type = string
}

variable "igw_id" {
  type = string
}

variable "public_subnet_a" {
  type = string
}

variable "public_subnet_b" {
  type = string
}

variable "name" {
  type = string
}
