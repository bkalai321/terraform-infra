provider "aws" {
  region = var.aws_region
}

module "jenkins_slave_iam_profile" {
  source         = "../../../../aws/iam/service"
  name           = data.terraform_remote_state.vpc.outputs.vpc_name
  component      = var.component
  policy_content = file("files/jenkins-slave-iam-profile.json")
}

