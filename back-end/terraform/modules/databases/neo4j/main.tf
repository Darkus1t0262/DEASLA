resource "aws_instance" "neo4j" {
  ami                    = "ami-0fc5d935ebf8bc3bc" # Ubuntu 22.04 LTS
  instance_type          = "t3.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.db_sg_id]
  key_name               = var.key_name

  user_data = <<-EOF
    #!/bin/bash
    export NEO4J_AUTH=neo4j/${var.db_password}

    wget -O - https://debian.neo4j.com/neotechnology.gpg.key | sudo apt-key add -
    echo 'deb https://debian.neo4j.com stable 5' | sudo tee /etc/apt/sources.list.d/neo4j.list
    apt-get update
    apt-get install -y neo4j

    echo 'NEO4J_AUTH=neo4j/${var.db_password}' >> /etc/environment
    systemctl enable neo4j
    systemctl start neo4j
  EOF

  tags = {
    Name = var.identifier
  }
}

output "neo4j_public_ip" {
  value = aws_instance.neo4j.public_ip
}
