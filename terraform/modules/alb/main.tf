resource "aws_lb" "main" {
  name               = "deas-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = []
  subnets            = var.public_subnet_ids
}

resource "aws_lb_target_group" "services" {
  count    = length(var.public_subnet_ids)
  name     = "tg-${count.index}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "instance"
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.services[0].arn
  }
}
