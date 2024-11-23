module "vpc-perimeter-igw" {
  source = "../modules/igw"

  #Input read from variables.tf
  vpc-perimeter = var.vpc-perimeter
  subnet-id-igw = var.subnet-id-igw
}

module "vpc-perimeter-alb" {
  source = "../modules/alb"

  #Input read from variables.tf
  vpc-cidr  = var.vpc_cidr
  subnet-id = var.subnet-id-alb
}

module "vpc-perimeter-tgw" {
  source = "../modules/tgw"

  #Input read from variables.tf
  peering-id                      = var.peering-id
  transit_gateway_route_table_arn = var.transit_gateway_route_table_arn
}

module "vpc-perimeter-nat-gateway" {
  source = "../modules/natgw"

  #Input read from variables.tf
  subnet-id-natgw = var.subnet-id-egress
}