resource "aws_lb" "deas_alb" {
  name               = "deas-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = var.public_subnet_ids

  tags = {
    Name = "deas-alb"
  }
}

resource "aws_lb_target_group" "deas_tg" {
  name     = "deas-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = {
    Name = "deas-tg"
  }
}

resource "aws_lb_listener" "deas_listener" {
  load_balancer_arn = aws_lb.deas_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.deas_tg.arn
  }
}