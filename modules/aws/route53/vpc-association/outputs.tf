output "vpc_association_id" {
  value = aws_route53_zone_association.main.id
}

output "vpc_association_zone_id" {
  value = aws_route53_zone_association.main.zone_id
}

output "vpc_association_vpc_id" {
  value = aws_route53_zone_association.main.vpc_id
}

output "vpc_association_vpc_region" {
  value = aws_route53_zone_association.main.vpc_region
}

