resource "aws_lb_listener" "https" {
  count             = length(var.certificate_arn) > 0 ? 1 : 0
  load_balancer_arn = var.alb_arn
  port              = var.listener_port
  protocol          = var.listener_protocol

  ssl_policy      = var.ssl_policy
  certificate_arn = var.certificate_arn

  default_action {
    target_group_arn = var.target_group_arn
    type             = var.listener_default_action_type
  }
}

resource "aws_lb_listener" "http" {
  count = length(var.certificate_arn) > 0 ? 0 : 1

  load_balancer_arn = var.alb_arn
  port              = var.listener_port
  protocol          = var.listener_protocol

  default_action {
    target_group_arn = var.target_group_arn
    type             = var.listener_default_action_type
  }
}

