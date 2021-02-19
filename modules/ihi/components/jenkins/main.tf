provider "aws" {
  region = var.aws_region
}

module "jenkins_sg" {
  source      = "../../../aws/ec2/securitygroup"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id
  name        = data.terraform_remote_state.vpc.outputs.vpc_name
  component   = var.component
  jenkinsUser = "terraform"
}

module "jenkins_sg_rule" {
  source = "../../../aws/ec2/securitygroup/security-rule/cidr"

  main_rules = [
    "ingress",
    "-1",
    "-1",
    "18.209.77.206/32:${data.terraform_remote_state.vpc.outputs.vpc_cidr_block}:99.43.125.145/32:10.40.0.0/16",
    "-1",
    "egress",
    "0",
    "0",
    "0.0.0.0/0",
    "-1",
  ]

  security_group_id = "${module.jenkins_sg.id}"
}

module "jenkins_key_pair" {
  source     = "../../../aws/ec2/keypair"
  component  = var.component
  name       = data.terraform_remote_state.vpc.outputs.vpc_name
  public_key = file("files/public-keys.txt")
}

module "jenkins_iam_profile" {
  source         = "../../../aws/iam/service"
  name           = data.terraform_remote_state.vpc.outputs.vpc_name
  component      = var.component
  policy_content = file("files/iam-profile-jenkins.json")
}

module "jenkins_elb" {
  source    = "../../../aws/ec2/elb/elb"
  myVersion = var.myVersion
  name      = data.terraform_remote_state.vpc.outputs.vpc_name
  component = var.component

  security_groups                  = [module.jenkins_sg.id]
  subnets                          = [ for subnets in data.terraform_remote_state.vpc.outputs.private_subnets_id: subnets ]
  healthy_check_target             = "HTTP:8080/login"
  health_check_healthy_threshold   = 2
  health_check_unhealthy_threshold = 5
  health_check_timeout             = 10
  health_check_interval            = 60
  listener_lb_port                 = ["80", "49187"]
  listener_lb_protocol             = ["HTTP", "TCP"]
  listener_instance_port           = ["8080", "49187"]
  listener_instance_protocol       = ["HTTP", "TCP"]
  internal                         = true
}

module "jenkins" {
  source = "../../../aws/ec2/asg/elb"

  name                          = data.terraform_remote_state.vpc.outputs.vpc_name
  component                     = var.component
  asg_min_size                  = "1"
  asg_max_size                  = "1"
  image_id                      = var.image_id
  instance_type                 = "m4.large"
  iam_instance_profile          = module.jenkins_iam_profile.iam_instance_profile_name
  security_groups               = [module.jenkins_sg.id]
  aws_key_pair_name             = module.jenkins_key_pair.aws_key_pair_name
  user_data                     = file("files/jenkins-userdata.sh")
  vpc_zone_identifier           = data.terraform_remote_state.vpc.outputs.private_subnets_id
  availability_zones            = data.terraform_remote_state.vpc.outputs.private_subnet_availability_zone
  myVersion                     = var.myVersion
  load_balancers                = [ for name in module.jenkins_elb.name: name ]
  health_check_default_cooldown = "500"
  health_check_grace_period     = "500"
  # volume_size = "100"
  # volume_type           = "io1"
  # iops                  = "5000"
  # delete_on_termination = true
}

module "jenkins_route53_record" {
  # depends_on        = [module.jenkins]
  source             = "../../../aws/route53/record"
  hosted_zone_id     = data.terraform_remote_state.vpc.outputs.private_hosted_zone_id
  domain_name        = var.component
  hosted_domain_name = data.terraform_remote_state.vpc.outputs.hosted_domain_name
  dns_type           = "CNAME"
  record_ips         = module.jenkins_elb.dns_name
}

# module "jenkins_slave_iam_group" {
#   source    = "../../../aws/iam/user/group"
#   policy    = file("files/iam-profile-create-slave.json")
#   name      = data.terraform_remote_state.vpc.outputs.vpc_name
#   component = var.component
# }

# module "attach_user_to_group" {
#   source         = "../../../aws/iam/user/user-group-attachment"
#   user_iam_name  = var.user_iam_name
#   group_iam_name = [module.jenkins_slave_iam_group.group_name]
# }

