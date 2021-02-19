provider "aws" {
  region = var.aws_region
}

module "vpc_peering" {
  source = "../../../aws/vpc/vpc-peering"

  peer_owner_id = "460093719278"
  peer_vpc_id   = "vpc-7b9f4b00"
  vpc_id        = data.terraform_remote_state.vpc.outputs.vpc_id
  name          = var.name
  peer_name     = "ihi-main-to-ihi-admin"
}

module "vpc_peering_route" {
  source = "../../../aws/vpc/route/vpc-peering"

  destination_cidr_block    = ["10.40.100.0/24"]
  availability_zones        = [for az in data.terraform_remote_state.vpc.outputs.private_subnet_availability_zone: az]
  vpc_peering_connection_id = [module.vpc_peering.id]
  route_table_id            = [for nat in data.terraform_remote_state.vpc.outputs.nat_route_table_id: nat]
}

module "vpc_peering_route_1" {
  source = "../../../aws/vpc/route/vpc-peering"

  destination_cidr_block    = ["10.40.115.0/24"]
  availability_zones        = [for az in data.terraform_remote_state.vpc.outputs.private_subnet_availability_zone: az]
  vpc_peering_connection_id = [module.vpc_peering.id]
  route_table_id            = [for nat in data.terraform_remote_state.vpc.outputs.nat_route_table_id: nat]
}

module "vpc_peering_route_2" {
  source = "../../../aws/vpc/route/vpc-peering"

  destination_cidr_block    = ["10.40.116.0/24"]
  availability_zones        = [for az in data.terraform_remote_state.vpc.outputs.private_subnet_availability_zone: az]
  vpc_peering_connection_id = [module.vpc_peering.id]
  route_table_id            = [for nat in data.terraform_remote_state.vpc.outputs.nat_route_table_id: nat]
}

module "vpc_peering_internet_route" {
  source = "../../../aws/vpc/route/vpc-peering"

  destination_cidr_block    = ["10.40.100.0/24"]
  availability_zones        = [for az in data.terraform_remote_state.vpc.outputs.public_subnet_availability_zone: az]
  vpc_peering_connection_id = [module.vpc_peering.id]
  route_table_id            = [for internet in data.terraform_remote_state.vpc.outputs.internet_route_table_id: internet]
}

module "vpc_peering_internet_route_1" {
  source = "../../../aws/vpc/route/vpc-peering"

  destination_cidr_block    = ["10.40.115.0/24"]
  availability_zones        = [for az in data.terraform_remote_state.vpc.outputs.public_subnet_availability_zone: az]
  vpc_peering_connection_id = [module.vpc_peering.id]
  route_table_id            = [for internet in data.terraform_remote_state.vpc.outputs.internet_route_table_id: internet]
}

module "vpc_peering_internet_route_2" {
  source = "../../../aws/vpc/route/vpc-peering"

  destination_cidr_block    = ["10.40.116.0/24"]
  availability_zones        = [for az in data.terraform_remote_state.vpc.outputs.public_subnet_availability_zone: az]
  vpc_peering_connection_id = [module.vpc_peering.id]
  route_table_id            = [for internet in data.terraform_remote_state.vpc.outputs.internet_route_table_id: internet]
}

# module "vpc_peering_old_private_route" {
#   source = "../../../aws/vpc/route/vpc-peering"
#   destination_cidr_block = ["10.201.0.0/16"]
#   availability_zones = ["us-east-1c"]
#   vpc_peering_connection_id = ["${module.vpc_peering.peering_id}"]
#   route_table_id = ["${data.terraform_remote_state.vpc.internet_route_table_id}"]
# }
