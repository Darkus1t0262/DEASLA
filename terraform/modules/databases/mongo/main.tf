resource "aws_instance" "mongo" {
  ami                    = "ami-0fc5d935ebf8bc3bc" # Ubuntu 22.04 LTS
  instance_type          = "t3.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.db_sg_id]
  key_name               = var.key_name

  user_data = <<-EOF
    #!/bin/bash
    # Add MongoDB official repo
    wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | apt-key add -
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-6.0.list

    apt-get update
    apt-get install -y mongodb-org

    # Configure remote access
    sed -i 's/bindIp: 127.0.0.1/bindIp: 0.0.0.0/' /etc/mongod.conf
    echo "security:\n  authorization: enabled" >> /etc/mongod.conf

    systemctl enable mongod
    systemctl start mongod

    # Create admin user
    sleep 10
    mongo admin --eval 'db.createUser({user: "${var.db_user}", pwd: "${var.db_password}", roles: [{role: "root", db: "admin"}]})'
  EOF

  tags = {
    Name = var.identifier
  }
}

output "mongo_public_ip" {
  value = aws_instance.mongo.public_ip
}
