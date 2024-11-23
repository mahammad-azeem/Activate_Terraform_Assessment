variable "vpc-id" {
  type = string
  description = "Already created vpc id"
  default = "vpc-perimeter"
}

variable "source-cidr-block" {
  type = string
  description = "cidr block for vpc-perimeter > subnet containing tgwa"
  default = "100.125.100.240/28"
}