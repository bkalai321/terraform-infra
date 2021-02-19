variable "fortios_host" {
  description = "fortios host to connect to fortios vpn"
}

variable "fortios_token" {
  description = "fortios token to connect to fortios vpn"
}

variable "name" {
  description = "fortios global system name"
}

# network interfaces
variable "dmz_ip" {
  description = "dmz ip range"
}

variable "wan1_ip" {
  description = "dmz ip range"
}
variable "wan2_ip" {
  description = "dmz ip range"
}

# dns configuration
variable "dns_primary" {
  description = "primary dns address"
  default = "8.8.8.8"
}

variable "dns_secondary" {
  description = "secondary dns address"
  default = "8.8.8.8"
}