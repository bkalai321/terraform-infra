output "lc_name" {
  description = "Name of LC created"
  value       = aws_launch_configuration.main.name
}

output "lc_id" {
  description = "ID of LC created"
  value       = aws_launch_configuration.main.id
}

output "asg_name" {
  description = "Name of ASG created"
  value       = aws_autoscaling_group.main.name
}

output "asg_id" {
  description = "ID of ASG created"
  value       = aws_autoscaling_group.main.id
}

output "asg_arn" {
  description = "Arn of ASG created"
  value       = aws_autoscaling_group.main.arn
}

