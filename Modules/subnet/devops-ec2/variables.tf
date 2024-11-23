variable "vpc-id" {
  type = string
  description = "Already created vpc id"
  default = "vpc-devops"
}

variable "source-cidr-block" {
  type = string
  description = "cidr block for vpc-devops > subnet containing ec2"
  default = "100.126.100.0/27"
}

variable "target-cidr-block" {
  type = string
  description = "cidr block for target subnet under vpc-perimeter (to create route table)"
  default = "100.125.100.32/27"
}

variable "egress_only_gateway_id" {
  type = string
  description = "Egress gateway id under vpc-perimeter"
  default = "egress_only_gateway_id"
}

variable "vpc_peering_connection_id" {
  type = string
  description = "vpc peering connection id between vpc-devops and vpc-perimeter"
  default = "vpc_peering_connection_id"
}