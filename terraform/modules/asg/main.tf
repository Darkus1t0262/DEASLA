resource "aws_launch_template" "this" {
  name_prefix   = "deasla-core-lt-"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = var.security_group_ids

  user_data = filebase64("${path.module}/user_data.sh")

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "this" {
  name                      = "deasla-core-asg"
  max_size                  = 3
  min_size                  = 1
  desired_capacity          = 1
  vpc_zone_identifier       = var.subnet_ids
  health_check_type         = "EC2"
  health_check_grace_period = 60
  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }
  target_group_arns = [var.alb_target_group_arn]

  tag {
    key                 = "Name"
    value               = "deasla-core-instance"
    propagate_at_launch = true
  }
}
