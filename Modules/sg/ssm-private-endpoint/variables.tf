variable "vpc_id" {
  type = string
  description = "id of the vpc devops"
  default = "vpc-devops"
}

variable "subnet_ids_ssm" {
  type = string
  description = "IDs of subnet devops who allowed"
  default = "100.126.100.0/27"
}