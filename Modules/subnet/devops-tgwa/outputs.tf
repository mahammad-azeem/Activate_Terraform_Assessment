output "aws_subnet_id" {
  value = aws_subnet.devops-tgwa-subnet.id
}

output "aws_route_table_id" {
  value = aws_route_table.devops-tgwa-route-table.id
}

output "aws_network_acl_id" {
  value = aws_network_acl.devops-tgwa-nacl.id
}