variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_id" {
  default = "vpc-0b4752c9ffbcbc68a"
}

variable "name" {
  default = "stephen-docker"
}

variable "component" {
  default = "pilot"
}

variable "image_id" {
  default = "ami-04d1df6f2ba74afa5"
}

variable "availability_zone" {
  default = "us-east-1f"
}

variable "subnet_id" {
  default = "subnet-07400e2537e83b21f"
}

variable "instance_type" {
  default = "m4.large"
}

variable "user_data" {
  default = "files/scheduler-userdata.sh"
}

variable "jenkinsUser" {
}

variable "folderPath" {
}

variable "build_url" {
}

variable "volume_size" {
  default = 50
}

variable "key_pair" {
  default = "ihies-east-1"
}

variable "terminateInHrs" {
}

