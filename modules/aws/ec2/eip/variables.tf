variable "use_vpc" {
  description = "use the vpc or not. boolean"
  default     = "true"
}

variable "instance_id" {
  description = "Instance ID where public ip has to be associated"
  type        = string
}

variable "private_ip" {
  description = "Private ip address to be associated"
}

variable "environment" {
  description = "environment name"
  default     = "dev"
}

variable "name" {
  description = "Name of the stack"
}

variable "component" {
}

