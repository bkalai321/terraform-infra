locals {
    vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
    vpc_cidr_block = data.terraform_remote_state.vpc.outputs.vpc_cidr_block
}