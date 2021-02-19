resource "aws_lb" "main" {
  subnets            = var.subnets
  security_groups    = var.security_groups
  load_balancer_type = var.load_balancer_type
  internal           = var.internal

  tags = {
    Name = "${var.name}-${var.component}-${var.myVersion}-alb"
  }
}

resource "aws_alb_target_group" "main" {
  port     = var.host_listener_port
  protocol = var.host_protocol
  vpc_id   = var.vpc_id

  deregistration_delay = var.deregistration_delay

  health_check {
    path                = var.health_check_path
    interval            = var.health_check_interval
    port                = var.health_check_traffic_port
    protocol            = var.health_check_protocol
    timeout             = var.health_check_timeout
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
    matcher             = var.health_check_matcher
  }

  stickiness {
    type            = var.stickiness_type
    cookie_duration = var.stickiness_cookie_duration
    enabled         = var.stickiness_enabled
  }

  tags = {
    Name = "${var.name}-${var.component}-${var.myVersion}-target-group"
  }
}

