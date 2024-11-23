output "alb_dns_name" {
  value = aws_lb.vpc-perimeter-lb.id
}