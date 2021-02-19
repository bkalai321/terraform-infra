variable "name" {
}

variable "component" {
}

variable "myVersion" {
}

variable "subnets" {
  type = list(string)
}

variable "security_groups" {
  type = list(string)
}

variable "load_balancer_type" {
  default = "application"
}

variable "internal" {
  default = "true"
}

### target_group

variable "health_check_path" {
  default = "/"
}

variable "health_check_interval" {
  default = "60"
}

variable "health_check_traffic_port" {
  default = "traffic-port"
}

variable "health_check_protocol" {
  default = "HTTP"
}

variable "health_check_timeout" {
  default = "180"
}

variable "health_check_healthy_threshold" {
  default = "10"
}

variable "health_check_unhealthy_threshold" {
  default = "3"
}

variable "health_check_matcher" {
  default = "200-299"
}

variable "host_listener_port" {
  default = "8080"
}

variable "host_protocol" {
  default = "HTTP"
}

variable "vpc_id" {
}

variable "deregistration_delay" {
  default = "60"
}

variable "stickiness_type" {
  default = "lb_cookie"
}

variable "stickiness_cookie_duration" {
  default = "360"
}

variable "stickiness_enabled" {
  default = "true"
}

