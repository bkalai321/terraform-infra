provider "aws" {
  region = var.aws_region
}

locals {
  timestamp           = timestamp()
  timestamp_sanitized = replace(local.timestamp, "/[-| |T|Z|:]/", "")
}

data "aws_db_snapshot" "latest_ignition-core_snapshot" {
  db_instance_identifier = var.db_instance_identifier
  most_recent            = true
}

locals {
  snapshot_id = data.aws_db_snapshot.latest_ignition-core_snapshot.id
}

module "ignition-core" {
  source               = "../../../aws/rds/rds"
  instance_class       = var.instance_class
  name_identifier      = var.name_identifier
  name                 = var.name
  snapshot_identifier  = local.snapshot_id
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  engine_version       = var.engine_version
  skip_final_snapshot  = var.skip_final_snapshot
  username             = var.username
  password             = var.password
  db_subnet_group_name = var.db_subnet_group_name
  parameter_group_name = var.parameter_group_name
}

# module "route53-simple-record" {
#   source =  "../../../aws/route53/simple-route53-record"
#   zone_id = "${var.zone_id}"
#   domain_name    = "${var.domain_name}"
#   hosted_domain_name = "${var.hosted_domain_name}"
#   type    = "${var.type}"
#   ttl     = "${var.ttl}"
#   record_value = "${module.jiradb.address}"
# }
