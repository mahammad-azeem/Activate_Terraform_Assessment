terraform {
  required_providers {
    aws {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
#Create custom route table for perimeter tgwa subnet

resource "aws_route_table" "perimeter-tgwa-route-table" {
  vpc_id = var.vpc-id

  route {
    cidr_block = var.source-cidr-block
  }
    tags = {
      Name = "perimeter-tgwa-route-table"
  }
}

#Create subnet for perimeter tgwa

resource "aws_subnet" "perimeter-tgwa-subnet" {
  vpc_id = var.vpc-id
  cidr_block = var.source-cidr-block

  tags = {
    Name = "perimeter-tgwa-subnet"
  }
}

#Create and associate Network Access Control lists to perimeter tgwa subnet

resource "aws_network_acl" "perimeter-tgwa-nacl" {
  vpc_id = var.vpc-id
  subnet_ids = aws_subnet.perimeter-tgwa-subnet.id

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
    Name = "perimeter-tgwa-nacl"
  }
}

#Associate perimeter-tgwa-route-table route table to  perimeter-tgwa-subnet

resource "aws_route_table_association" "perimeter-tgwa-subnet-route-table_association" {
  subnet_id = aws_subnet.perimeter-tgwa-subnet.id
  route_table_id = aws_route_table.perimeter-tgwa-route-table.id
}