locals {
  vpc_id = length(var.vpc_id) > 1 ? var.vpc_id : module.vpcLocals.vpc_id
}
