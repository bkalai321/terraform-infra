data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket  = "ihi-main-terraform-us-east-1"
    key     = "terraform/ihi/network/ihi-main-vpc/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

# data "aws_ami" "jenkins" {
#   most_recent = true

#   filter {
#     name  = "tag:Use"
#     values = ["Jenkins"]
#   }
    
#   owners = [ data.terraform_remote_state.vpc.outputs.owner_id ]
    
# }

