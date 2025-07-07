resource "aws_instance" "microservice" {
  ami                    = "ami-0c2b8ca1dad447f8a"
  instance_type          = "t2.micro"
  count                  = length(var.instance_name)
  key_name               = "deas-key"
  subnet_id              = var.public_subnet_ids[count.index % length(var.public_subnet_ids)]
  vpc_security_group_ids = [var.security_group_id]

  user_data = templatefile("${path.module}/cloud-init.sh.tpl", {
    docker_images = var.docker_images[count.index]
  })

  tags = {
    Name = var.instance_name[count.index]
  }
}
