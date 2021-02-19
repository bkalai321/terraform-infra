variable "aws_region" {
  description  = "name of aws region"
  default = "us-east-1"
}

variable "name" {
  description = "name of aws-vpn componets"
}
variable "vpc_id" {
  description = "vpc id"
}
variable "customer_gateway_ip" {
  description = "customer gateway ip address"
}
variable "vpn_gateway_id" {
  description = "vpn gateway id"
  default = ""
}

variable "amazon_side_asn" {
  description = "The Autonomous System Number (ASN) for the Amazon side of the gateway. By default the virtual private gateway is created with the current default Amazon ASN."
  default     = "64512"
}

variable "vpc_routing_table_ids" {
  description = "vpc routing table ids"
  type = list(string)
  default = []
}

variable "psksecret"  {
  description = "presharedkey for vpn tunnels"
}

variable "destination_cidr_block" {
  description = "destination cidr blocks"
}