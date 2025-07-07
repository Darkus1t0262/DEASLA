resource "aws_instance" "gateway" {
  ami                    = "ami-0d5eff06f840b45e9" # Ubuntu 22.04 LTS in us-east-1
  instance_type          = "t3.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name

  user_data = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y nginx

    cat <<EOT > /etc/nginx/sites-available/default
    server {
        listen 80 default_server;
        listen [::]:80 default_server;
        location / {
            proxy_pass http://${var.backend_lb_dns};
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
        }
    }
    EOT

    systemctl restart nginx
    systemctl enable nginx
  EOF

  tags = {
    Name = "deasla-api-gateway"
  }
}
