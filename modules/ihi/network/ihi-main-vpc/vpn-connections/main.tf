provider "aws" {
  region = var.aws_region
}

module "vpn_gateway" {
  source = "../../../../aws/vpc/gateway/virtual-private-gateways"

  name      = data.terraform_remote_state.vpc.outputs.vpc_name
  component = var.component
}

module "vpn_gateway_attachment" {
  source         = "../../../../aws/vpc/gateway/virtual-private-gateways/attachment"
  vpc_id         = data.terraform_remote_state.vpc.outputs.vpc_id
  vpn_gateway_id = module.vpn_gateway.id
}

module "vpn_gateway_route_propagation" {
  source                = "../../../../aws/vpc/gateway/virtual-private-gateways/route-table-propogation"
  vpn_gateway_id        = module.vpn_gateway.id
  route_table_id        = [ for route_table_id in data.terraform_remote_state.vpc.outputs.nat_route_table_id: route_table_id ]
  countGateway          = length(data.terraform_remote_state.vpc.outputs.nat_route_table_id)
}

module "customer_gateway" {
  source              = "../../../../aws/vpc/gateway/customer-gateways"
  office_ip_addr_cidr = data.terraform_remote_state.vpc.outputs.office_ip_cidr_block
  name                = data.terraform_remote_state.vpc.outputs.vpc_name
  component           = var.component
}

module "aws_vpn_connection" {
  source = "../../../../aws/vpc/vpn-connections"

  customer_gateway_id = module.customer_gateway.id
  vpn_gateway_id      = module.vpn_gateway.id
  name                = data.terraform_remote_state.vpc.outputs.vpc_name
  component           = var.component
}

module "aws_vpn_connection_route" {
  source = "../../../../aws/vpc/vpn-connections/connection-route"

  destination_cidr_block = ["192.168.0.0/21"]
  vpn_connection_id      = module.aws_vpn_connection.id
}

# module "vpn_gateway_route_table" {
#   source = "../../../../aws/vpc/route-table/internet"
#   vpc_id = "${data.terraform_remote_state.vpc.vpc_id}"
#   name = "${data.terraform_remote_state.vpc.vpc_name}"
#   availability_zones = ["${data.terraform_remote_state.vpc.private_subnet_availability_zone}"]
#   cidr_block = ["192.168.0.0/21"]
#   gateway_id = ["${module.vpn_gateway.id}"]
#   subnet_id = ["${data.terraform_remote_state.vpc.private_subnets_id}"]
# }
# module "th_customer_gateway" {
#   source = "../../../../aws/vpc/gateway/customer-gateways"
#   office_ip_addr_cidr = "99.43.125.147/32"
#   name = "${data.terraform_remote_state.vpc.vpc_name}"
#   component = "typhoon-hil"
# }
# module "th_aws_vpn_connection" {
#   source = "../../../../aws/vpc/vpn-connections"
#   customer_gateway_id = "${module.customer_gateway.id}"
#   vpn_gateway_id = "${module.vpn_gateway.id}"
#   name = "${data.terraform_remote_state.vpc.vpc_name}"
#   component = "typhoon-hil"
# }
# module "th_aws_vpn_connection_route" {
#   source = "../../../../aws/vpc/vpn-connections/connection-route"
#   destination_cidr_block = ["192.168.0.0/21"]
#   vpn_connection_id = "${module.aws_vpn_connection.id}"
# }
