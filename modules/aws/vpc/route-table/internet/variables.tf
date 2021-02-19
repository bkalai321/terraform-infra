variable "vpc_id" {
}

variable "name" {
}

variable "availability_zones" {
  type = list(string)
}

variable "cidr_block" {
  type = list(string)
}

variable "gateway_id" {
  type = list(string)
}

variable "subnet_id" {
  type = list(string)
}

