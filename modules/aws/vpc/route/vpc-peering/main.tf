resource "aws_route" "main" {
  count = length(var.availability_zones)

  route_table_id            = element(var.route_table_id, count.index)
  destination_cidr_block    = element(var.destination_cidr_block, count.index)
  vpc_peering_connection_id = element(var.vpc_peering_connection_id, count.index)
}

