# terraform/modules/nat/variable.tf

variable "public_subnet_id" {
  type        = string
  description = "Public subnet where the NAT Gateway will be created"
}

variable "name" {
  type        = string
  description = "Name of NAT Gateway"
}
