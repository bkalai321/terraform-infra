resource "aws_route_table" "main" {
  count = length(var.availability_zones)

  vpc_id = var.vpc_id
  route {
    cidr_block = var.cidr_block[0]
    gateway_id = var.gateway_id[0]
  }
  tags = {
    Name = "${var.name}-${var.subnet_id[0]}-internet-route-table"
  }
}

