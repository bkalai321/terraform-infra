resource "aws_customer_gateway" "main" {
  bgp_asn    = random_integer.bgp_asn_number.result
  ip_address = local.office_ip
  type       = "ipsec.1"

  tags = {
    Name = "${var.name}-${var.component}-customer-gateway"
  }
}

resource "random_integer" "bgp_asn_number" {
  min = 65138
  max = 65150
  keepers = {
    ami = "${var.name}-${var.component}"
  }
}

locals {
  office_ip = element(split("/", var.office_ip_addr_cidr), 0)
}

