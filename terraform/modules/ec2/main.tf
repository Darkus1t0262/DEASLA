variable "instance_name" {}
variable "docker_image" {}

resource "aws_instance" "microservice" {
  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2
  instance_type = "t2.micro"
  count         = length(var.instance_name)
  key_name      = "deas-key"  # Ensure this key pair exists

  user_data = templatefile("${path.module}/cloud-init.sh.tpl", {
    docker_image = var.docker_image[count.index]
  })

  tags = {
    Name = var.instance_name[count.index]
  }
}
