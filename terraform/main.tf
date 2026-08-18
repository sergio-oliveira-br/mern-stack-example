# terraform/main.tf


# -----
# VPC
# -----
module "vpc" {
  source     = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
  name       = "mern-vpc"
}

# -----
# Subnets
# -----
module "subnets_public" {
  source       = "./modules/subnets_public"
  vpc_id       = module.vpc.id
  cidr_block_a = "10.0.1.0/24"
  cidr_block_b = "10.0.2.0/24"
  az_a         = "eu-west-1a"
  az_b         = "eu-west-1b"
  name         = "mern"
}

module "subnets_private" {
  source       = "./modules/subnets_private"
  vpc_id       = module.vpc.id
  cidr_block_a = "10.0.3.0/24"
  cidr_block_b = "10.0.4.0/24"
  az_a         = "eu-west-1a"
  az_b         = "eu-west-1b"
  name         = "mern"
}

# -----
# Internet Gateway
# -----
module "igw" {
  source = "./modules/igw"
  vpc_id = module.vpc.id
  name   = "mern-igw"
}


# -----
# Internet Gateway
# -----
module "nat" {
  source            = "./modules/nat"
  public_subnet_id  = module.subnets_public.public_a_id
  name              = "mern-nat"
}


# -----
# Route Tables
# -----
module "route_table_public" {
  source           = "./modules/route_table_public"
  vpc_id           = module.vpc.id
  igw_id           = module.igw.id
  public_subnet_a  = module.subnets_public.public_a_id
  public_subnet_b  = module.subnets_public.public_b_id
  name             = "mern"
}

module "route_table_private" {
  source            = "./modules/route_table_private"
  vpc_id            = module.vpc.id
  nat_id            = module.nat.id
  private_subnet_a  = module.subnets_private.private_a_id
  private_subnet_b  = module.subnets_private.private_b_id
  name              = "mern"
}


