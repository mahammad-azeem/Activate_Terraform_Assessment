terraform {
  required_providers {
    aws {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
#Create custom route table for devops tgwa subnet

resource "aws_route_table" "devops-tgwa-route-table" {
  vpc_id = var.vpc-id

  route {
    cidr_block = var.source-cidr-block
  }
    tags = {
      Name = "devops-tgwa-route-table"
  }
}

#Create subnet for devops tgwa

resource "aws_subnet" "devops-tgwa-subnet" {
  vpc_id = var.vpc-id
  cidr_block = var.source-cidr-block

  tags = {
    Name = "devops-tgwa-subnet"
  }
}

#Create and associate Network Access Control lists to devops tgwa subnet

resource "aws_network_acl" "devops-tgwa-nacl" {
  vpc_id = var.vpc-id
  subnet_ids = aws_subnet.devops-tgwa-subnet.id

  egress {
    protocol = "tcp"
    rule_no = 200
    action = "allow"
    cidr_block = var.source-cidr-block
    from_port = "443"
    to_port = "443"
  }

  ingress {
    protocol = "tcp"
    rule_no = 100
    action = "allow"
    cidr_block = var.source-cidr-block
    from_port = "80"
    to_port = "80"
  }

  tags = {
    Name = "devops-tgwa-nacl"
  }
}

#Associate devops-tgwa-route-table route table to  devops-tgwa-subnet

resource "aws_route_table_association" "devops-tgwa-subnet-route-table_association" {
  subnet_id = aws_subnet.devops-tgwa-subnet.id
  route_table_id = aws_route_table.devops-tgwa-route-table.id
}