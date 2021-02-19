resource "aws_route_table" "main" {
  count = length(var.availability_zones)

  vpc_id = var.vpc_id

  route {

    cidr_block     = var.cidr_block[count.index]
    nat_gateway_id = var.nat_gateway_id[count.index]
  }

  tags = {
    Name = "${var.name}-${var.subnet_id[count.index]}-nat-route-table"
  }
}

