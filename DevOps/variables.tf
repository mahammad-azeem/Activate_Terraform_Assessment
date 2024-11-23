variable "aws_access_key" {
  type = string
  description = "AWS Access Key"
  sensitive   = true
}

variable "aws_secret_key" {
  type = string
  description = "AWS Secret Key"
  sensitive   =  true
}

variable "aws_iam_role_policy" {
  type = string
  description = "AWS Role Policy for AWS."
  sensitive   = true
}

variable "aws_iam_profile_name" {
  type = string
  description = "Name of the AWS profile"
  sensitive   = true
}