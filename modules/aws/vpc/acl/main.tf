resource "aws_network_acl" "main" {
  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids

  egress {
    protocol   = element(var.main_network_acl_egress_rules, 0)
    rule_no    = element(var.main_network_acl_egress_rules, 1)
    action     = element(var.main_network_acl_egress_rules, 2)
    cidr_block = element(var.main_network_acl_egress_rules, 3)
    from_port  = element(var.main_network_acl_egress_rules, 4)
    to_port    = element(var.main_network_acl_egress_rules, 5)
  }

  ingress {
    protocol   = element(var.main_network_acl_ingress_rules, 0)
    rule_no    = element(var.main_network_acl_ingress_rules, 1)
    action     = element(var.main_network_acl_ingress_rules, 2)
    cidr_block = element(var.main_network_acl_ingress_rules, 3)
    from_port  = element(var.main_network_acl_ingress_rules, 4)
    to_port    = element(var.main_network_acl_ingress_rules, 5)
  }

  tags = {
    Name      = "${var.name}-${var.component}"
    Component = var.component
  }
}

