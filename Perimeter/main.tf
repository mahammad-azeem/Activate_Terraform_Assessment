terraform {
  backend "s3" {
    bucket = "terraform-state-perimeter"
    key = "tf-perimeter/tf.state"
    region = "south-eastasia-1"
    dynamodb_table = "terraform-state-locking"
    encrypt = true
  }
  required_providers {
    aws {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_vpc" "vpc-devops" {
  cidr_block = var.vpc_cidr_block
}