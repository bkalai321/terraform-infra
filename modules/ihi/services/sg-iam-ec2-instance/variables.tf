variable "name" {
  default = "ihi-main"
}

variable "component" {
  default = "sg"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_id" {
  default = ""
}
variable "policy_file_name"{
  default = "files/iam-profile-pilot.json"
}