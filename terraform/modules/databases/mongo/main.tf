resource "aws_instance" "mongo" {
  ami                    = "ami-0d5eff06f840b45e9" # Ubuntu 22.04 in us-east-1
  instance_type          = "t3.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.db_sg_id]
  key_name               = var.key_name

  user_data = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y mongodb
    systemctl start mongodb
    systemctl enable mongodb
  EOF

  tags = {
    Name = var.identifier
  }
}
