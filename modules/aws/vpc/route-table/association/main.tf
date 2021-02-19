resource "aws_route_table_association" "main" {
  count = length(var.availability_zones)

  subnet_id      = var.subnet_id[0]
  route_table_id = var.route_table_id[0]
}

