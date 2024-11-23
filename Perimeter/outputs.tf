output "perimeter-peering-output" {
  value = aws_networkmanager_transit_gateway_route_table_attachment.perimeter-tgw.id
}

output "alb_dns_name" {
  value = aws_lb.vpc-perimeter-lb.id
}

output "aws_igw_output" {
  value = aws_internet_gateway.perimeter-igw.id
}

output "aws_subnet_id" {
  value = aws_subnet.perimeter-inspection-subnet.id
}

output "aws_route_table_id" {
  value = aws_route_table.perimeter-inspection-route-table.id
}

output "aws_network_acl_id" {
  value = aws_network_acl.perimeter-inspection-nacl.id
}