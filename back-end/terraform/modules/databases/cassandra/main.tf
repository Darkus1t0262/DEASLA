provider "aws" {
  region  = "us-east-1"
  profile = "default" # Remove this if you're using env vars
}

resource "aws_instance" "cassandra" {
  ami                    = "ami-0d5eff06f840b45e9" # Ubuntu 22.04 LTS in us-east-1
  instance_type          = "t3.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.db_sg_id]
  key_name               = var.key_name

  user_data = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y docker.io
    systemctl start docker
    systemctl enable docker

    docker pull cassandra:4.1

    docker run -d --name cassandra \
      -p 9042:9042 \
      -e CASSANDRA_CLUSTER_NAME=DEASCluster \
      -e CASSANDRA_DC=us-east \
      -e CASSANDRA_RACK=rack1 \
      -e CASSANDRA_ENDPOINT_SNITCH=GossipingPropertyFileSnitch \
      cassandra:4.1

    docker update --restart unless-stopped cassandra
  EOF

  tags = {
    Name = var.identifier
  }
}

output "cassandra_public_ip" {
  description = "Public IP of the Cassandra instance"
  value       = aws_instance.cassandra.public_ip
}
