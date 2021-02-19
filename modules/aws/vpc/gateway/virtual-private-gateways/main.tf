resource "aws_vpn_gateway" "main" {
  tags = {
    Name = "${var.name}-${var.component}-vpn-gateway"
  }
}

