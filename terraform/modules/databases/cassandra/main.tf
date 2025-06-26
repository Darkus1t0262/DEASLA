resource "aws_instance" "cassandra" {
  ami                    = "ami-0d5eff06f840b45e9"
  instance_type          = "t3.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.db_sg_id]
  key_name               = var.key_name

  user_data = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y openjdk-11-jdk
    echo "deb http://www.apache.org/dist/cassandra/debian 311x main" | tee -a /etc/apt/sources.list.d/cassandra.sources.list
    curl https://downloads.apache.org/cassandra/KEYS | apt-key add -
    apt-get update
    apt-get install -y cassandra
    systemctl start cassandra
    systemctl enable cassandra
  EOF

  tags = {
    Name = var.identifier
  }
}
