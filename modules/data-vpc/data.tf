data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket  = "ihi-main-terraform-${var.aws_region}"
    key     = "terraform/ihi/network/ihi-main-vpc/terraform.tfstate"
    region  = var.aws_region
    encrypt = true
  }
}