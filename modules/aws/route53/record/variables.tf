variable "domain_name" {
}

variable "hosted_zone_id" {
}

variable "dns_type" {
  default = "A"
}

variable "dns_ttl" {
  default = "300"
}

variable "record_ips" {
  type = list(string)
}

variable "domain_name_weight" {
  default = "100"
}

variable "hosted_domain_name" {
}

