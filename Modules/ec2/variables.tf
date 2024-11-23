variable "region" {
  type = string
  description = "Region to provision the devops EC2 vm"
  default = "ap-southeastasia-1"
}

variable "instance_name" {
  type = string
  description = "name of devops EC2"
  default = "devops"
}

variable "ami" {
  type = string
  description = "ami of devops EC2"
  default =  "ami-03245313bb09844"
}

variable "instance_type" {
  type = string
  description = "instance type of devops EC2"
  default = "t2.micro"
}

variable "subnet_id" {
  type = string
  description = "Subnet mask of the devops ec2 subnet"
  default = "100.126.100.0/27"
}

variable "key_name" {
  type = string
  description = "EC2 VM SSH key pair"
  default = "key-pair"
}

