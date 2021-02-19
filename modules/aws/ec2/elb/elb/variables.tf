variable "name" {
}

variable "component" {
}

variable "myVersion" {
}

variable "security_groups" {
  type = list(string)
}

variable "subnets" {
  type = list(string)
}

variable "health_check_healthy_threshold" {
  default = 2
}

variable "health_check_unhealthy_threshold" {
  default = 4
}

variable "health_check_timeout" {
  default = 300
}

variable "health_check_interval" {
  default = 30
}

variable "healthy_check_target" {
  description = "Format PROTOCOL:PORT:PATH PATH is required when lb_protocol is TCP/SSL"
}

variable "listener_lb_port" {
  type = list(string)
}

variable "listener_lb_protocol" {
  type = list(string)
}

variable "listener_instance_port" {
  type = list(string)
}

variable "listener_instance_protocol" {
  type = list(string)
}

variable "ssl_certificate_id" {
  type        = string
  description = "ARN of ssl certificate uploaded to AWS IAM. Only required when lb_protocol is HTTPS/SSL"
  default     = "default_value"
}

variable "internal" {
  default = true
}

