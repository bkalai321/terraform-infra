provider "aws" {
  region = var.aws_region
}

##############
# Customer Gateway
##############
resource "aws_customer_gateway" "main" {
  bgp_asn    = 65000
  ip_address = var.customer_gateway_ip
  type       = "ipsec.1"

  tags = {
    "Name" = var.name
  }
}

##############
# VPN Gateway
##############
resource "aws_vpn_gateway" "this" {
  count = var.vpn_gateway_id == "" ? 1 : 0

  vpc_id          = var.vpc_id
  amazon_side_asn = var.amazon_side_asn

  tags = {
    "Name" = var.name
  }
}

resource "aws_vpn_gateway_attachment" "this" {
  count           = var.vpn_gateway_id == "" ? 1 : 0
  vpc_id          = var.vpc_id
  vpn_gateway_id  = aws_vpn_gateway.this.0.id
}

resource "aws_vpn_gateway_route_propagation" "this" {
  count = var.vpn_gateway_id == "" ? 1 : 0

  route_table_id = element(var.vpc_routing_table_ids, count.index)
  vpn_gateway_id = element(
    concat(
      aws_vpn_gateway.this.*.id,
      aws_vpn_gateway_attachment.this.*.vpn_gateway_id,
    ),
    count.index,
  )
}

##############
# VPN Connections
##############

resource "aws_vpn_connection" "this" {
  vpn_gateway_id      = var.vpn_gateway_id == "" ? aws_vpn_gateway.this.0.id : var.vpn_gateway_id
  customer_gateway_id = aws_customer_gateway.main.id
  type                = "ipsec.1"

  static_routes_only = true

  tunnel1_preshared_key = var.psksecret
  tunnel2_preshared_key = var.psksecret

  tags = {
    "Name" = var.name
  }
}

resource "aws_vpn_connection_route" "this" {
  destination_cidr_block = var.destination_cidr_block
  vpn_connection_id      = aws_vpn_connection.this.id
}