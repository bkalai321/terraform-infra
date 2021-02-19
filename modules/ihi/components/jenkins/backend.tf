# terraform {
#   backend "s3" {
#     bucket  = "ihi-main-terraform-us-east-1"
#     key     = "terraform/ihi/components/jenkins/terraform.tfstate"
#     region  = "us-east-1"
#     encrypt = true
#   }
# }

terraform {
  backend "s3" {
    bucket  = "ihi-main-terraform-us-east-1"
    key     = "terraform/ihi/components/jenkins/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

