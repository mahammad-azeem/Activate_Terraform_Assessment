variable "aws_iam_role_policy" {
  type        = string
  description = "AWS ARN for IAM for SSMRole"
  sensitive   = true
}

variable "aws_iam_profile_name" {
  type        = string
  description = "AWS IAM Instance Profile for IAM Role"
  default     = "SSMInstanceProfile"
}