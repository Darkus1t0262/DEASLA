resource "aws_instance" "core_microservices" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = "deas-core-key"
  associate_public_ip_address = true

  tags = {
    Name = "core-prod-instance"
  }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install docker -y
              service docker start
              usermod -a -G docker ec2-user

              docker pull darkjus/auth-service:latest
              docker pull darkjus/user-service:latest
              docker pull darkjus/profile-service:latest
              docker pull darkjus/role-service:latest
              docker pull darkjus/language-service:latest

              docker run -d \
                -p 3001:3001 \
                --name auth-service \
                -e POSTGRES_HOST=44.218.146.40 \
                -e POSTGRES_PORT=5432 \
                -e POSTGRES_USER=admin \
                -e POSTGRES_PASSWORD=securepasspg \
                -e POSTGRES_DB=deaslapg \
                -e JWT_SECRET=supersecretjwtvalue \
                darkjus/auth-service:latest

              docker run -d \
                -p 3002:3002 \
                --name user-service \
                -e POSTGRES_HOST=44.218.146.40 \
                -e POSTGRES_PORT=5432 \
                -e POSTGRES_USER=admin \
                -e POSTGRES_PASSWORD=securepasspg \
                -e POSTGRES_DB=coredb \
                -e JWT_SECRET=supersecretjwtvalue \
                darkjus/user-service:latest

              docker run -d \
                -p 3003:3003 \
                --name profile-service \
                -e POSTGRES_HOST=44.218.146.40 \
                -e POSTGRES_PORT=5432 \
                -e POSTGRES_USER=admin \
                -e POSTGRES_PASSWORD=securepasspg \
                -e POSTGRES_DB=deaslapg \
                -e REDIS_HOST=54.236.32.169 \
                -e REDIS_PORT=6379 \
                -e JWT_SECRET=supersecretjwtvalue \
                darkjus/profile-service:latest

              docker run -d \
                -p 3004:3004 \
                --name role-service \
                -e NEO4J_URI=bolt://35.174.150.119:7687 \
                -e NEO4J_USER=neo4j \
                -e NEO4J_PASSWORD=securepassneo4j123 \
                -e JWT_SECRET=supersecretjwtvalue \
                darkjus/role-service:latest

              docker run -d \
                -p 3005:3005 \
                --name language-service \
                -e POSTGRES_HOST=44.218.146.40 \
                -e POSTGRES_PORT=5432 \
                -e POSTGRES_USER=admin \
                -e POSTGRES_PASSWORD=securepasspg \
                -e POSTGRES_DB=deaslapg \
                -e MONGO_URI=mongodb://admin:securepassmongo@10.0.0.250:27017/?authSource=admin \
                -e JWT_SECRET=supersecretjwtvalue \
                darkjus/language-service:latest

              echo "@reboot root docker start; docker start auth-service user-service profile-service role-service language-service" >> /etc/crontab
              EOF

  vpc_security_group_ids = [aws_security_group.allow_all.id]
}

resource "aws_security_group" "allow_all" {
  name        = "core-allow-all"
  description = "Allow inbound traffic on ports 3001-3005"

  ingress {
    from_port   = 3001
    to_port     = 3005
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}