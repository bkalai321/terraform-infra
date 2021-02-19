###not tested
resource "aws_security_group" "main_rule_endpoints" {
  count             = "${length(split(",",endpoints_prefix_list_ids)) > 0 ? 1:0}"
  type              = "${var.endpoints_rule_type}"
  to_port           = "${var.endpoints_rule_to_port}"
  protocol          = "${var.endpoints_rule_protocol}"
  from_port         = "${var.endpoints_rule_from_port}"
  security_group_id = "${var.endpoints_rule_security_group_id}"
  prefix_list_ids   = ["${var.endpoints_prefix_list_ids}"]
}