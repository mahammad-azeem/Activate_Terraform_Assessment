variable "aws_access_key" {
  type          = string
  description   = "Required"
  sensitive     = true
}

variable "aws_secret_key" {
  type          = string
  description   = "Required"
  sensitive     = true
}

variable "transit_gateway_route_table_arn" {
  type = string
  description = "tgw route table arn"
  sensitive = true
}