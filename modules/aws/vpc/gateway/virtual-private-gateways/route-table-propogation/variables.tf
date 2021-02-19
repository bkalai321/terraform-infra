variable "vpn_gateway_id" {
  type        = string
  description = "describe your variable"
}

variable "route_table_id" {
  type        = list(string)
  description = "describe your variable"
}

variable "countGateway" {
  type        = string
  description = "describe your variable"
  default     = "1"
}

