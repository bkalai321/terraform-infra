terraform {
  backend "s3" {
    bucket  = "ihi-main-terraform-us-east-1"
    key     = "terraform/ihi/components/jenkins/jenkins-slave/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

