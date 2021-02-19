# DNS 
resource "fortios_system_setting_dns" "this" {
    primary = var.dns_primary
    secondary = var.dns_secondary
}