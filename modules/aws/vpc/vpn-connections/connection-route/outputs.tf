output "destination_cidr_block" {
  value = aws_vpn_connection_route.main.*.destination_cidr_block
}

output "vpn_connection_id" {
  value = aws_vpn_connection_route.main.*.vpn_connection_id
}

