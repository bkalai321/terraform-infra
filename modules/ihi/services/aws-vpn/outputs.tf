# output "aws_vpc"  {
#   value = data.aws_vpc.selected.*
# }

# output "vpn_connection" {
#   value = aws_vpn_connection.this.*
# }

# output "vpn_connection_tunnel1_address" {
#   value = aws_vpn_connection.this.tunnel1_address
# }

# output "aws_vpc"  {
#   value = module.aws_vpn.aws_vpc
# }

output "vpn_connection" {
  value = module.aws_vpn.vpn_connection
}

output "vpn_connection_tunnel1_address" {
  value = module.aws_vpn.vpn_connection_tunnel1_address
}

output "vpn_connection_tunnel1_cgw_inside_address" {
  value = module.aws_vpn.vpn_connection_tunnel1_cgw_inside_address
}
