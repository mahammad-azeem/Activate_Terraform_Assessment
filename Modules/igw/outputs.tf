output "aws_natgw_output" {
  value = aws_nat_gateway.vpc-perimeter-nat-gateway.id
}