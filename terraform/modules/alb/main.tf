
resource "aws_lb" "main" {
  name               = "deas-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = var.public_subnet_ids
  security_groups    = []

  tags = {
    Name = "deas-alb"
  }
}
