terraform {
 backend "s3" {
    bucket = "ihi-main-terraform-us-east-1"
    key    = "ihi/components/active_directory/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}