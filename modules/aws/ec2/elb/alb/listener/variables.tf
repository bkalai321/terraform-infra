variable "listener_port" {
  default = "443"
}

variable "listener_protocol" {
  default = "HTTPS"
}

variable "ssl_policy" {
  default = "ELBSecurityPolicy-2016-08"
}

#variable "ssl_policy" {default = ""}
variable "certificate_arn" {
  default = ""
}

variable "listener_default_action_type" {
  default = "forward"
}

variable "target_group_arn" {
}

variable "alb_arn" {
}

