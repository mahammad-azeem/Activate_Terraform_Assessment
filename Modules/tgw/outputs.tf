output "perimeter-peering-output" {
  value = aws_networkmanager_transit_gateway_route_table_attachment.perimeter-tgw.id
}