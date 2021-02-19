### Creating ELB
locals {
  httpCount  = var.listener_lb_protocol[0] == "HTTP" ? 1 : 0
  tcpCount   = var.listener_lb_protocol[0] == "TCP" ? 2 : 0
  sslCount   = var.listener_lb_protocol[0] == "SSL" ? 3 : 0
  httpsCount = var.listener_lb_protocol[0] == "HTTPS" ? 4 : 0
}

output "httpcount" {
  value = local.httpCount == "1" ? local.httpCount : local.tcpCount
}

resource "aws_elb" "http" {
  count           = local.httpCount == 1 ? local.httpCount : local.tcpCount
  name            = "${var.name}-${var.component}-${var.myVersion}"
  security_groups = var.security_groups
  subnets         = var.subnets
  internal        = var.internal
  health_check {
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
    timeout             = var.health_check_timeout
    interval            = var.health_check_interval
    target              = var.healthy_check_target
  }
  listener {
    lb_port           = var.listener_lb_port[0]
    lb_protocol       = var.listener_lb_protocol[0]
    instance_port     = var.listener_instance_port[0]
    instance_protocol = var.listener_instance_protocol[0]
  }

  listener {
    lb_port           = var.listener_lb_port[1]
    lb_protocol       = var.listener_lb_protocol[1]
    instance_port     = var.listener_instance_port[1]
    instance_protocol = var.listener_instance_protocol[1]
  }
}

resource "aws_elb" "https" {
  count           = local.httpsCount == 1 ? local.httpsCount : local.sslCount
  name            = "${var.name}-${var.component}-${var.myVersion}"
  security_groups = var.security_groups
  internal        = var.internal

  health_check {
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
    timeout             = var.health_check_timeout
    interval            = var.health_check_interval
    target              = var.healthy_check_target
  }
  listener {
    lb_port            = var.listener_lb_port[0]
    lb_protocol        = var.listener_lb_protocol[0]
    instance_port      = var.listener_instance_port[0]
    instance_protocol  = var.listener_instance_protocol[0]
    ssl_certificate_id = var.ssl_certificate_id
  }

  listener {
    lb_port           = var.listener_lb_port[1]
    lb_protocol       = var.listener_lb_protocol[1]
    instance_port     = var.listener_instance_port[1]
    instance_protocol = var.listener_instance_protocol[1]
  }
}

