output "aws_subnet_id" {
  value = aws_subnet.perimeter-inspection-subnet.id
}

output "aws_route_table_id" {
  value = aws_route_table.perimeter-inspection-route-table.id
}

output "aws_network_acl_id" {
  value = aws_network_acl.perimeter-inspection-nacl.id
}