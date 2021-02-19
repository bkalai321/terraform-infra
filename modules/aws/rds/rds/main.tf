resource "aws_db_instance" "main" {
  instance_class       = var.instance_class
  name                 = var.name
  snapshot_identifier  = var.snapshot_identifier
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  engine_version       = var.engine_version
  identifier           = var.name_identifier
  skip_final_snapshot  = var.skip_final_snapshot
  username             = var.username
  password             = var.password
  db_subnet_group_name = var.db_subnet_group_name
  parameter_group_name = var.parameter_group_name
  tags = {
    Name            = var.name_identifier
    type-deployment = var.type-deployment
    component       = var.component
  }
  lifecycle {
    ignore_changes = [snapshot_identifier]
  }
}

