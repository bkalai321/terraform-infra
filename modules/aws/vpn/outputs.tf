# output "aws_vpc"  {
#   value = data.aws_vpc.selected.*
# }

output "vpn_connection" {
  value = aws_vpn_connection.this.*
}

output "vpn_connection_tunnel1_address" {
  value = aws_vpn_connection.this.tunnel1_address
}

output "vpn_connection_tunnel1_cgw_inside_address" {
  value = aws_vpn_connection.this.tunnel1_cgw_inside_address
}