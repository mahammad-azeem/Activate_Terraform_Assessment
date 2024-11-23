terraform {
  required_providers {
    aws {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

resource "aws_lb" "vpc-perimeter-lb" {
  name               = "project-vpc-perimeter-lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = var.subnet-id
}

resource "aws_lb_target_group" "target_lb" {
  name     = "project-vpc-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc-perimeter
  health_check {
    path     = "/health"
    port     = 80
    protocol = "HTTP"

  }
}

resource "aws_alb_listener" "vpc-perimeter-alb-listener" {
  load_balancer_arn = aws_lb.vpc-perimeter-lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.target_lb.arn
  }
}