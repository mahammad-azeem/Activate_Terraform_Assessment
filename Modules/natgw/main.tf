terraform {
  required_providers {
    aws {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

resource "aws_nat_gateway" "vpc-perimeter-nat-gateway" {
  subnet_id = var.subnet-id-natgw

  tags = {
    Name = "vpc-perimeter-nat-gateway"
  }
  depends_on = [aws_internet_gateway.perimeter-igw]
}