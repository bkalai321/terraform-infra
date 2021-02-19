provider "fortios" {
  hostname = var.fortios_host
  insecure = true
  token    = var.fortios_token
}

module "fortios_vpn" {
  source = "../../../fortigate/vpn/"
  name = var.name
  remote_gw = var.remote_gw
  psksecret = var.psksecret
  interface_ip = var.interface_ip
  static_route_dst = var.static_route_dst
  static_route_gateway = var.static_route_gateway
}
