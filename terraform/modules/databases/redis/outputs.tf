output "redis_public_ip" {
  value = aws_instance.redis_instance.public_ip
}

output "redis_connection_string" {
  value = "redis://${aws_instance.redis_instance.public_ip}:6379"
}
