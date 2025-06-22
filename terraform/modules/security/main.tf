
resource "aws_security_group" "bastion_sg" {
  name        = "bastion-sg"
  description = "Allow SSH access"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from anywhere (adjust for production)"
    from_port   = 22
    to_port     = 22
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

resource "aws_instance" "bastion" {
  ami                         = "ami-0c55b159cbfafe1f0"
  instance_type               = "t2.micro"
  key_name                    = "deas-key"
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [aws_security_group.bastion_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "bastion-host"
  }
}
