variable "vpc-perimeter" {
  type = string
  description = "perimeter vpc id for igw"
  default = "vpc-perimeter"
}

variable "subnet-id-igw" {
  type = string
  description = "internet subnet id"
  default = "100.125.100.32/27"
}