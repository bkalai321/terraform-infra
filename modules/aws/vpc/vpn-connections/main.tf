resource "aws_vpn_connection" "main" {
  vpn_gateway_id      = var.vpn_gateway_id
  customer_gateway_id = var.customer_gateway_id
  type                = "ipsec.1"
  static_routes_only  = true

  tags = {
    Name = "${var.name}-${var.component}-vpn-connection"
  }
}

