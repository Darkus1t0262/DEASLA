resource "aws_instance" "redis_instance" {
  ami                         = "ami-053b0d53c279acc90" # Ubuntu 22.04 LTS (us-east-1)
  instance_type               = "t2.micro"
  subnet_id                   = "subnet-0e37b5e4aa4224e3d"
  vpc_security_group_ids      = ["sg-04ba736cd6865725d"]
  key_name                    = "deas-key2" # Cambia si usas otra clave

  associate_public_ip_address = true

  tags = {
    Name        = "deasla-redis"
    Environment = "qa"
    ManagedBy   = "Terraform"
  }

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y docker.io
              systemctl start docker
              systemctl enable docker
              docker run -d --name redis-server -p 6379:6379 redis:7
              docker update --restart always redis-server
            EOF
}
