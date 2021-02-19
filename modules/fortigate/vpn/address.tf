resource "fortios_firewall_object_address" "this" {
    count = var.object_address != "" ? 1 : 0
    name = var.name
    type = "ipmask"
    subnet = var.object_address
    comment = var.name
}