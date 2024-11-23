output "aws_subnet_id" {
  value = aws_subnet.devops-ec2-subnet.id
}

output "aws_route_table_id" {
  value = aws_route_table.devops-ec2-route-table.id
}

output "aws_network_acl_id" {
  value = aws_network_acl.devops-ec2-nacl.id
}