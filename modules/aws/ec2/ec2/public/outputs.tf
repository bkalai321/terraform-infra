output "instance_id" {
  value = aws_instance.main.*.id
}

output "instance_arn" {
  value = aws_instance.main.*.arn
}

output "instance_security_groups" {
  value = aws_instance.main.*.security_groups
}

