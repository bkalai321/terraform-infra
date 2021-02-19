terraform {
 backend "s3" {
    bucket = "ihi-main-terraform-us-east-1"
    key    = "ihi/network/third-party-vpc/peering/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
