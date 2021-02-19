resource "aws_route53_zone" "private" {
  name    = var.hosted_domain_name
  comment = var.comment

  vpc {
    vpc_id = var.vpc_id
  }

  tags = {
    Name     = "${var.name}-private-route53zone"
    Resource = "Private"
  }
}

resource "aws_route53_zone" "public" {
  name    = var.hosted_domain_name
  comment = var.comment

  tags = {
    Name     = "${var.name}-public-route53zone"
    Resource = "Public"
  }
}

