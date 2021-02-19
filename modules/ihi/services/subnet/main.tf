provider "aws" {
  region = var.aws_region
}

module "private_subnet" {
  source = "../../../aws/vpc/subnet"
  availability_zone = [ for az in var.private_az: az ]
  vpc_id            = local.vpc_id
  vpc_cidr_block    = local.vpc_cidr_block
  octet_bit         = var.octet_bit
  third_octet       = var.subnet_third_octet
  last_octet        = var.last_octet
  name              = var.name
  component         = var.subnet_component
}

module "nat_route_table" {
  source = "../../../aws/vpc/route-table/nat"
  vpc_id             = local.vpc_id
  availability_zones = [ for az in var.private_az: az ]
  subnet_id          = [ for subnets in module.private_subnet.subnet_id: subnets ]
  cidr_block         = [ for az in var.private_az: var.all_public_ip_cidr ]
  nat_gateway_id     = [ for az in var.private_az: var.nat_gateway_id ]
  name = var.name
}

module "nat_route_association" {
  source = "../../../aws/vpc/route-table/association"
  availability_zones = [ for az in var.private_az: az ]
  subnet_id      = [ for subnets in module.private_subnet.subnet_id: subnets ]
  route_table_id = [ for routes in module.nat_route_table.route_id: routes ]
}
