resource "aws_subnet" "main" {
  count  = length(var.availability_zone)
  vpc_id = var.vpc_id
  cidr_block = cidrsubnet(
    var.vpc_cidr_block,
    var.octet_bit,
    var.third_octet * count.index + var.last_octet,
  )
  map_public_ip_on_launch = var.map_public_ip_on_launch
  availability_zone       = var.availability_zone[count.index]

  tags = {
    Name = "${var.name}-${var.component}-subnets-${count.index}"
  }
}

