output "instance_ip_addr" {
  value = aws_instance.devopsvm.private_ip
}

output "aws_vpc_id" {
  value = aws_vpc.vpc-devops.id
}

output "aws_security_group_ssm" {
  value = aws_security_group.allow-ssh-ssm.id
}