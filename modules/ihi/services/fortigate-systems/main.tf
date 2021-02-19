provider "fortios" {
  hostname = var.fortios_host
  insecure = true
  token    = var.fortios_token
}

module "fortios_neworks" {
  source = "../../../fortigate/network"
  dmz_ip = var.dmz_ip
  wan1_ip = var.wan1_ip
  wan2_ip = var.wan2_ip
  dns_primary = var.dns_primary
  dns_secondary = var.dns_secondary
}

module "fortios_system" {
  source = "../../../fortigate/system"
  hostname = var.name
}