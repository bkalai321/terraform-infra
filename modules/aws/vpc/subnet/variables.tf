variable "availability_zone" {
  type = list(string)
}

variable "vpc_id" {
}

variable "vpc_cidr_block" {
}

variable "octet_bit" {
  default = "8"
}

variable "third_octet" {
  description = "Third octet number. Has to be unique"
}

variable "name" {
}

variable "component" {
}

variable "map_public_ip_on_launch" {
  default = "false"
}

variable "last_octet" {
  default = "0"
}

