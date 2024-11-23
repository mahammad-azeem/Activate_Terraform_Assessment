output "aws_subnet_id" {
  value = aws_subnet.perimeter-tgwa-subnet.id
}

output "aws_route_table_id" {
  value = aws_route_table.perimeter-tgwa-route-table.id
}

output "aws_network_acl_id" {
  value = aws_network_acl.perimeter-tgwa-nacl.id
}