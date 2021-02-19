# interfaces  
variable "dmz_ip" {
  description = "dmz ip range"
}
variable "wan1_ip" {
  description = "wan1 ip range"
}
variable "wan2_ip" {
  description = "wan2 ip range"
}

# dns configuration
variable "dns_primary" {
  description = "primary dns address"
  default = "8.8.8.8"
}

variable "dns_secondary" {
  description = "secondary dns address"
  default = "8.8.4.4"
}