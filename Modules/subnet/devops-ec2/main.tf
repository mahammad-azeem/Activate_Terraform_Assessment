terraform {
  required_providers {
    aws {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
#Create custom route table for devops ec2 subnet

resource "aws_route_table" "devops-ec2-route-table" {
  vpc_id = var.vpc-id

  route {
    cidr_block                = var.target-cidr-block
    egress_only_gateway_id    = var.egress_only_gateway_id
    vpc_peering_connection_id = var.vpc_peering_connection_id
  }
    tags = {
      Name = "devops-ec2-route-table"
  }
}

#Create subnet for devops ec2

resource "aws_subnet" "devops-ec2-subnet" {
  vpc_id = var.vpc-id
  cidr_block = var.source-cidr-block

  tags = {
    Name = "devops-ec2-subnet"
  }
}

#Create and associate Network Access Control lists to devops ec2 subnet

resource "aws_network_acl" "devops-ec2-nacl" {
  vpc_id = var.vpc-id
  subnet_ids = aws_subnet.devops-ec2-subnet.id

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
    Name = "devops-ec2-nacl"
  }
}

#Associate devops-ec2-route-table route table to  devops-ec2-subnet

resource "aws_route_table_association" "devops-ec2-subnet-route-table_association" {
  subnet_id = aws_subnet.devops-ec2-subnet.id
  route_table_id = aws_route_table.devops-ec2-route-table.id
}