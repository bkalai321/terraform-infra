output "vpc_id" {
  value = aws_vpn_gateway_attachment.main.vpc_id
}

output "vpn_gateway_id" {
  value = aws_vpn_gateway_attachment.main.vpn_gateway_id
}

