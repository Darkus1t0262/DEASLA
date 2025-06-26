output "public_ip" {
  value = aws_instance.gateway.public_ip
}

output "private_ip" {
  value = aws_instance.gateway.private_ip
}
output "instance_id" {
  value = aws_instance.gateway.id
}