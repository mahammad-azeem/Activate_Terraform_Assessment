variable "vpc-id" {
  type = string
  description = "Already created vpc id"
  default = "vpc-devops"
}

variable "source-cidr-block" {
  type = string
  description = "cidr block for vpc-devops > subnet containing tgwa"
  default = "100.126.100.240/28"
}