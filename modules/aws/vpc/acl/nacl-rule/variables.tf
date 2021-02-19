variable "network_acl_id" {
  description = "Network ACL ID"
}

variable "egress" {
  description = "if egress its true otherwise ingress its false"
}

variable "acl_rules" {
  type = list(string)
}

