output "postgres_public_ip" {
  value = aws_instance.postgres_ec2.public_ip
}

output "postgres_connection_string" {
  value = "postgresql://${var.db_user}:${var.db_password}@${aws_instance.postgres_ec2.public_ip}:5432/${var.db_name}"
}
