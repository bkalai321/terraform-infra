variable "name" {
  type = string
}

variable "component" {
  type = string
}

variable "user_data" {
  type        = string
  description = "user data in file format"
}

variable "availability_zone" {
}

variable "key_pair" {
}

variable "ami" {
}

variable "instance_type" {
}

variable "security_groups" {
}

variable "subnet_id" {
}

variable "iam_instance_profile" {
}

variable "private_ip_address" {
}

variable "build_url" {
  default = "null"
}

