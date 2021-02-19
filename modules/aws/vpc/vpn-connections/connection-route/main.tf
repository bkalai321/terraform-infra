resource "aws_vpn_connection_route" "main" {
  count = length(var.destination_cidr_block)

  destination_cidr_block = element(var.destination_cidr_block, count.index)
  vpn_connection_id      = var.vpn_connection_id
}

