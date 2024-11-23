terraform {
  required_providers {
    aws {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
#Create custom route table for perimeter inspection subnet

resource "aws_route_table" "perimeter-inspection-route-table" {
  vpc_id = var.vpc-id

  route {
    cidr_block = var.source-cidr-block
  }
    tags = {
      Name = "perimeter-inspection-route-table"
  }
}

#Create subnet for perimeter inspection

resource "aws_subnet" "perimeter-inspection-subnet" {
  vpc_id = var.vpc-id
  cidr_block = var.source-cidr-block

  tags = {
    Name = "perimeter-inspection-subnet"
  }
}

#Create and associate Network Access Control lists to perimeter inspection subnet

resource "aws_network_acl" "perimeter-inspection-nacl" {
  vpc_id = var.vpc-id
  subnet_ids = aws_subnet.perimeter-inspection-subnet.id

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
    Name = "perimeter-inspection-nacl"
  }
}

#Associate perimeter-inspection-route-table route table to  perimeter-inspection-subnet

resource "aws_route_table_association" "perimeter-inspection-subnet-route-table_association" {
  subnet_id = aws_subnet.perimeter-inspection-subnet.id
  route_table_id = aws_route_table.perimeter-inspection-route-table.id
}