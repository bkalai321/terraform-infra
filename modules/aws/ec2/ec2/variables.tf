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

variable "disable_api_termination" {
  default = "false"
}

variable "jenkinsUser" {
  default = "npant"
}

variable "build_url" {
  default = "null"
}

variable "folderPath" {
  default = "dontknow"
}

variable "terminate" {
  default = "true"
}

variable "volume_size" {
  default = 50
}

variable "versionNumber" {
  default = ""
}

variable "terminateInHrs" {
  default = 4
}

