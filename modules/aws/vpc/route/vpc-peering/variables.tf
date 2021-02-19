variable "route_table_id" {
  type = list(string)
}

variable "destination_cidr_block" {
  type = list(string)
}

variable "vpc_peering_connection_id" {
  type = list(string)
}

variable "availability_zones" {
  type = list(string)
}

