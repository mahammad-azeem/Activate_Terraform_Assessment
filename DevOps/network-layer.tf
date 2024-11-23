
module "devops-subnet-ec2" {
  source = "../modules/subnet/devops-ec2"

  #Input Variables are read from devops.tfvars file
  vpc-id = var.vpc_id
  source-cidr-block = var.src_cidr_block
  target-cidr-block = var.tgt_cidr_block
  egress_only_gateway_id = var.egress_only_gateway_id
  vpc_peering_connection_id = var.vpc_peering_connection_id
}


module "devops-subnet-ec2" {
  source = "../modules/subnet/devops-tgwa"

  #Input Variables are read from devops.tfvars file
  vpc-id = var.vpc_id
  source-cidr-block = var.src_cidr_block

}