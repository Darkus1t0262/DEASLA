resource "aws_launch_template" "microservice" {
  name_prefix   = "deas-launch-template-"
  image_id      = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  user_data = base64encode(templatefile("${path.module}/cloud-init.sh.tpl", {
    docker_images  = var.docker_images
  }))
}

resource "aws_autoscaling_group" "microservice_asg" {
  count               = length(var.instance_names)
  desired_capacity    = 1
  max_size            = 2
  min_size            = 1
  vpc_zone_identifier = var.public_subnet_ids
  launch_template {
    id      = aws_launch_template.microservice.id
    version = "$Latest"
  }
  target_group_arns = [var.target_group_arns[count.index]]
}
