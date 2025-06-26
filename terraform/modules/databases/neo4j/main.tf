resource "aws_instance" "neo4j" {
  ami                    = "ami-0d5eff06f840b45e9"
  instance_type          = "t3.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.db_sg_id]
  key_name               = var.key_name

  user_data = <<-EOF
    #!/bin/bash
    wget -O - https://debian.neo4j.com/neotechnology.gpg.key | sudo apt-key add -
    echo 'deb https://debian.neo4j.com stable 5' | sudo tee /etc/apt/sources.list.d/neo4j.list
    apt-get update
    apt-get install -y neo4j
    systemctl start neo4j
    systemctl enable neo4j
  EOF

  tags = {
    Name = var.identifier
  }
}
