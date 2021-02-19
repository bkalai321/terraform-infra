variable "name" {
}

variable "component" {
}

variable "vpc_id" {
}

variable "subnet_ids" {
  type = list(string)
}

variable "main_network_acl_egress_rules" {
}

variable "main_network_acl_ingress_rules" {
}

