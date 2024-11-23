module "vpc-perimeter-subnet-creation-tgw" {
  source = "../modules/subnet/perimeter-tgwa"

  #Inputs read from variables.tf

  vpc-id = var.vpc-perimeter
  source-cidr-block = var.subnet-id-tgw
}

module "vpc-perimeter-subnet-creation-inspection" {
  source = "../modules/subnet/perimeter-inspection"

  #Inputs read from variables.tf
  vpc-id = var.vpc-perimeter
  source-cidr-block = var.subnet-id-inspection
}