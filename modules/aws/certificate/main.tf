resource "aws_acm_certificate" "main" {
  domain_name       = "${var.domain_name}.${var.hosted_domain_name}"
  validation_method = var.validation_method

  tags = {
    Name = "${var.domain_name}-${var.hosted_domain_name}-cert"
  }

  lifecycle {
    create_before_destroy = true
  }
}

