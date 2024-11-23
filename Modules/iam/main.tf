terraform {
  required_providers {
    aws {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

#Create aws iam role to manage AWS session Manager access

resource "aws_iam_role" "ssm_role" {
      name = "SSMRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ssm_role_policy_attachment" {
  role       = var.aws_iam_role
  policy_arn = var.aws_iam_role_policy
}

resource "aws_iam_instance_profile" "ssm_profile" {
  name = var.aws_iam_profile_name
  role = var.aws_iam_role
}