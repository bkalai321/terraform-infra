resource "aws_eip" "main" {
  count = length(var.availability_zones)
  vpc   = true
  tags = {
    Name             = "${var.name}-${var.private_subnet_id[count.index]}-nat-gateway-eip"
    Public_SubnetId  = var.subnet_id[0]
    Private_SubnetId = var.private_subnet_id[0]
  }
}

resource "aws_nat_gateway" "main" {
  count = length(var.availability_zones)

  allocation_id = aws_eip.main[count.index].id
  subnet_id     = var.subnet_id[0]

  tags = {
    Name             = "${var.name}-nat-gateway-${count.index}"
    Environment      = var.environment
    Public_SubnetId  = var.subnet_id[0]
    Private_SubnetId = var.private_subnet_id[count.index]
  }
}

