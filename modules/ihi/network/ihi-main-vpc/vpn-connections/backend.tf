terraform {
  backend "s3" {
    bucket  = "ihi-main-terraform-us-east-1"
    key     = "terraform/ihi/network/ihi-main-vpc/vpc-connections/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}



