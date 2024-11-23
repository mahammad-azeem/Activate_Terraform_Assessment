terraform {
  required_providers {
    aws {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}



resource "aws_instance" "devopsvm" {
        ami                     = var.ami
        instance_type           = var.instance_type
        subnet_id               = var.subnet_id
        vpc_security_group_ids  = [var.security_group_id]
  associate_public_ip_address   = false
        key_name                = var.key_name

        iam_instance_profile = {
            name = aws_iam_instance_profile.ssm_profile.name
        }

        tags = {
          Name = var.instance_name
        }

}