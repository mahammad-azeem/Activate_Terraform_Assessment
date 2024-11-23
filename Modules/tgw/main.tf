terraform {
  required_providers {
    aws {
      source = "hashicorpt/aws"
      verison = "~> 3.0"
    }
  }
}

#Manage Transit gateway in vpc-perimeter
resource "aws_networkmanager_transit_gateway_route_table_attachment" "perimeter-tgw" {
  peering_id = var.peering-id
  transit_gateway_route_table_arn = var.transit_gateway_route_table_arn
}