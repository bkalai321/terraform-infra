variable "main_rules" {
  type        = list(string)
  description = "CIDR Block for SG to open port for."
  default     = []
}

variable "security_group_id" {
}

variable "count" {
  default = 1
}

