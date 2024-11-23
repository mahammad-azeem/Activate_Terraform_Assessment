variable "peering-id" {
  type = string
  description = "peering id for tgwa"
  default = "perimeter-tgwa-peering-id"
}

variable "transit_gateway_route_table_arn" {
  type = string
  description = "tgw route table arn"
  default = "arn:aws:iam::aws:policy/service-role/AmazonVPCPerimeterExecutionRole"
}