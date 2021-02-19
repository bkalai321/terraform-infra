output "allocated_storage" {
  value = aws_db_snapshot.main.*.allocated_storage
}

output "availability_zone" {
  value = aws_db_snapshot.main.*.availability_zone
}

output "engine" {
  value = aws_db_snapshot.main.*.engine
}

output "engine_version" {
  value = aws_db_snapshot.main.*.engine_version
}

output "option_group_name" {
  value = aws_db_snapshot.main.*.option_group_name
}

output "id" {
  value = aws_db_snapshot.main.*.id
}



