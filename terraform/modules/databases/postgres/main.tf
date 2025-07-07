resource "aws_instance" "postgres_ec2" {
  ami                    = "ami-0c7217cdde317cfec" # Amazon Linux 2 (us-east-1)
  instance_type          = "t2.micro"
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.db_sg_id]
  associate_public_ip_address = true

  tags = {
    Name = "deasla-core-postgres-ec2"
  }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install docker -y
              systemctl enable docker
              systemctl start docker
              docker run -d \
                --name postgres \
                -e POSTGRES_USER=${var.db_user} \
                -e POSTGRES_PASSWORD=${var.db_password} \
                -e POSTGRES_DB=${var.db_name} \
                -p 5432:5432 \
                postgres:15
              EOF
}
