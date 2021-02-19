variable "destination_cidr_block" {
  type        = list(string)
  description = "The CIDR block associated with the local subnet of the customer network."
}

variable "vpn_connection_id" {
  type        = string
  description = "The ID of the VPN connection."
}

