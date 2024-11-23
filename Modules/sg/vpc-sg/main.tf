terraform {
  required_providers {
    aws {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

resource "aws_security_group" "devops-ec2-sg" {
  name = "http_access"
  description = "Allow HTTPS traffic"
  vpc_id = var.vpc_id

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["100.125.100.32/27"]
  }

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["100.126.100.0/27"]
  }

  egress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = ["100.125.100.32/27"]
  }
}