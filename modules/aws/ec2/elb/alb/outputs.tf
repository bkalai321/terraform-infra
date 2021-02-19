output "alb_id" {
  description = "ID of alb created"
  value       = aws_lb.main.id
}

output "alb_arn" {
  description = "Arn of Alb created"
  value       = aws_lb.main.arn
}

output "alb_dns_name" {
  description = "DNS Name of ALB created"
  value       = aws_lb.main.dns_name
}

output "alb_dns_zone_id" {
  description = "The canonical hosted zone ID of the load balancer (to be used in a Route 53 Alias record)."
  value       = aws_lb.main.zone_id
}

output "lb_target_group_name" {
  value = aws_alb_target_group.main.name
}

output "target_group_arn" {
  value = aws_alb_target_group.main.arn
}

