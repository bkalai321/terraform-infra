terraform {
 backend "s3" {
    bucket = "ihi-main-terraform-us-east-1"
    key    = "terraform/ihi/components/dns_forwarder/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}