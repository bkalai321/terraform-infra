//this resource is used when we have to use record from one vpc to another.
// like when we have multi-region vpcs

resource "aws_route53_zone_association" "main" {
  zone_id = var.vpc_domain_hosted_zone_id
  vpc_id  = var.vpc_id
}

