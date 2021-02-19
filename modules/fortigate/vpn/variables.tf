variable "name" {
  description = "name of the vpn tunnel"
}

variable "remote_gw" {
  description = "Remote gateway public ip to connect the tunnels"
}
variable "psksecret" {
  description = "passphase key secrets"
}
variable "interface_ip" {
  description = "network interface ip"
}

variable "static_route_dst" {
  description = "networking static route destination"
}
variable "static_route_gateway" {
  description = "networking static route gateway"
  default = "0.0.0.0"
}

variable "object_address" {
  description = "object address subnet"
  default = ""
}