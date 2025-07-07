output "core_instance_public_ip" {
  value = aws_instance.core_microservices.public_ip
}
