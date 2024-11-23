terraform {
  required_providers {
    aws {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

#Creation of Internet Gateway

resource "aws_internet_gateway" "perimeter-igw" {
  vpc_id = var.vpc-perimeter

  tags = {
    Name = "vpc-perimeter-igw"
  }
}

#Creation of Route table (Route to Internet)

resource "aws_route_table" "igw-route-table" {
  vpc_id = var.vpc-perimeter

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.perimeter-igw.id
  }

  tags = {
    Name = "IGW route table"
  }
}

resource "aws_route_table_association" "vpc-perimeter-subnet-association" {
  subnet_id = var.subnet-id-igw
  route_table_id = aws_route_table.igw-route-table.id
}