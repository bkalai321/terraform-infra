resource "aws_vpc" "main" {
  cidr_block = var.cidr_block

  tags = {
    Name        = "${var.name}-vpc"
    Environment = var.environment
  }
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
}

# ###DHCP Options
# resource "aws_vpc_dhcp_options" "vpc_dhcp_option" {
#   domain_name         = "${var.dhcp_options_domain_name}"
#   domain_name_servers = ["${var.dhcp_options_domain_name_servers}"]
# }
