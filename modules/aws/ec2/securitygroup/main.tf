resource "aws_security_group" "main" {
  name        = "${var.name}-${var.component}-sg"
  description = "Main rule for egress/ingress"

  vpc_id = var.vpc_id
  tags = {
    Name        = "${var.name}-${var.component}-sg"
    jenkinsUser = var.jenkinsUser
  }
}

