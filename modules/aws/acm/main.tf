data "aws_acm_certificate" "myCert" {
  domain   = var.certDomain
  statuses = ["ISSUED"]
}

