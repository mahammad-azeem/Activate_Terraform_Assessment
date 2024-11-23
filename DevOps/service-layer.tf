locals {
  services = {
    "ec2messages" : {
      "name" : "com.amazonaws.${var.region}.ec2messages"
    },
    "ssm" : {
      "name" : "com.amazonaws.${var.region}.ssm"
    },
    "ssmmessages" : {
      "name" : "com.amazonaws.${var.region}.ssmmessages"
    }
  }
}


module "devops-ec2" {
  source = "../modules/ec2"

  #Input Variables are read from devops.tfvars file
  region = var.region
  instance_name = var.instance_name
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  key_name = var.key_name
}

module "security-group-ec2" {
  source = "../modules/sg/vpc-sg"

  #Input Variables are read from devops.tfvars file
  vpc_id = var.vpc_id
}

module "security-group-ssm" {
  source = "../modules/sg/ssm-private-endpoint"

  #Input Variables are read from variables.tf file
  vpc_id = var.vpc_id
  subnet_ids_ssm = var.subnet_id
}

module "devops-iam-manage-ssm" {
  source = "../modules/iam"

  #Input Variables are read from devops.tfvars file
  aws_iam_role_policy   =   var.aws_iam_role_policy
  aws_iam_profile_name  =   var.aws_iam_profile_name
}

resource "aws_vpc_endpoint" "ssm_endpoint" {
    for_each          = local.services
    vpc_id            = var.aws_vpc_id
    service_name      = each.value.name
    vpc_endpoint_type = "Interface"
    security_group_ids = [module.ssm-private-endpoint.allow-ssh-ssm]
  private_dns_enabled =  true
  ip_address_type = "ipv4"
  subnet_ids      = [module.devops-ec2.aws_subnet_id]
}