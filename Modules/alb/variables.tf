variable "vpc-cidr" {
  type = string
  description = "AWS VPC CIDR Block to use"
  default = "100.125.100.0/24"
}

variable "vpc-perimeter" {
  type        = string
  description = "VPC Perimeter id"
  default     = "vpc-perimeter"
}

variable "subnet-id" {
  type        = string
  description = "Subnet id"
  default     = "100.125.100.32/27"
}