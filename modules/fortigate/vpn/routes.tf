 resource "fortios_networking_route_static" "this" {
    dst = var.static_route_dst
    gateway = var.static_route_gateway
    blackhole = "disable"
    distance = "10"
    weight = "0"
    priority = "0"
    device = fortios_vpn_ipsec_phase1interface.this.id
    comment = "Terraform vpn static routes"
}