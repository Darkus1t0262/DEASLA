output "instance_public_ips" {
  value = aws_instance.microservice[*].public_ip
}
