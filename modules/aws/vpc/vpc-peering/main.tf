provider "aws" {
  alias  = "peer"
  region = var.peer_aws_region
}

resource "aws_vpc_peering_connection" "main" {
  peer_owner_id = var.peer_owner_id
  peer_vpc_id   = var.peer_vpc_id
  vpc_id        = var.vpc_id

  auto_accept = var.auto_accept_peering

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  tags = {
    Name = "${var.name}-${var.peer_name}-vpc-peerings"
  }
  //peer_region = "${var.peer_aws_region}"
}

locals {
  provider = var.peer_aws_region
}

resource "aws_vpc_peering_connection_accepter" "peer" {
  count                     = var.auto_accept_peering ? 0 : 1
  provider                  = aws.peer
  vpc_peering_connection_id = aws_vpc_peering_connection.main.id
  auto_accept               = var.peer_auto_accept

  tags = {
    Side = "Accepter"
  }
}

