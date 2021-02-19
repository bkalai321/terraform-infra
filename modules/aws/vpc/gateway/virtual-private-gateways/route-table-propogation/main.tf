resource "aws_vpn_gateway_route_propagation" "main" {
  count          = var.countGateway
  vpn_gateway_id = var.vpn_gateway_id
  route_table_id = element(var.route_table_id, count.index)
}

