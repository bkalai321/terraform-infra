output "instance_id" {
  value = aws_instance.main.id
}

output "instance_arn" {
  value = aws_instance.main.arn
}

output "instance_availability_zone" {
  value = aws_instance.main.availability_zone
}

output "instance_private_ip" {
  value = aws_instance.main.private_ip
}

output "instance_security_groups" {
  value = aws_instance.main.security_groups
}

output "component" {
  value = var.component
}

output "name" {
  value = var.name
}

