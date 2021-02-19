variable "peer_owner_id" {
}

variable "peer_vpc_id" {
}

variable "vpc_id" {
}

variable "auto_accept_peering" {
  default     = "true"
  description = "Accept the peering (both VPCs need to be in the same AWS account)."
}

variable "name" {
}

variable "peer_name" {
}

variable "peer_aws_region" {
  default = "us-east-1"
}

variable "peer_auto_accept" {
  default = "false"
}

