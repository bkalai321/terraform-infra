data "terraform_remote_state" "vpc" {
  backend = "s3"
  config {
    bucket = "ihi-main-terraform-us-east-1"
    key    = "terraform/ihi/network/ihi-main-vpc/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}

data "terraform_remote_state" "dns_forwarder" {
  backend = "s3"
  config {
    bucket = "ihi-main-terraform-us-east-1"
    key    = "terraform/ihi/components/dns_forwarder/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}