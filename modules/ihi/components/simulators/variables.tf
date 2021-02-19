variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_id" {
  default = "vpc-0b4752c9ffbcbc68a"
}

variable "name" {}

variable "image_id" {
  default = "ami-05e26687f1be125d7"
}

variable "availability_zone" {
  default = "us-east-1a"
}

variable "subnet_id" {
  default = "subnet-06ca68ca73e662d57"
}

variable "instance_type" {
  default = "t2.medium"
}

variable "user_data" {
  default = "files/simulators-userdata.bat"
}

variable "jenkinsUser" {}

variable "build_url" {
  default = "null"
}

variable "hosted_zone_id" {
  default = "Z1BVTKTRJERAM0"
}

variable "hosted_domain_name" {
  default = "aws.ihies.com"
}

variable "folderPath" {}

variable "component" {
  default = "component"
}

variable terminateInHrs {}
