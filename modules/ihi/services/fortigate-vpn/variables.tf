variable "fortios_host" {
  description = "fortios host to connect to fortios vpn"
}

variable "fortios_token" {
  description = "fortios token to connect to fortios vpn"
}
variable "name" {
  description = "name of the vpn tunnel"
}
variable "remote_gw" {
  description = "remote gateway/public IP of tunnel to connect. In case of AWS it should be first one"
}
variable "psksecret" {
  description = "passphase key secrets"
}

variable "interface_ip" {
  description = "network interface ip"
}

variable "static_route_dst" {
  description = "network static route destination cidr"
}

variable "static_route_gateway" {
  description = "networking static route gateway"
  default = "0.0.0.0"
}
