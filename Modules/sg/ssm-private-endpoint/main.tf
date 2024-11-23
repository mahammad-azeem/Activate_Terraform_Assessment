terraform {
  required_providers {
    aws {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

#Create security group for VPC private end point as part of managing SSM access for SSH into Devops VM

resource "aws_security_group" "allow-ssh-ssm" {
  name      = "allow-ssm"
  description = "Allow ssh"
  vpc_id = var.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = var.subnet_ids_ssm
  }
  egress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = var.subnet_ids_ssm
  }

  tags = {
    Name = "allow_ssh for ssm via iam"
  }
}