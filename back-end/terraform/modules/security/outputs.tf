output "microservice_sg_id" {
  description = "The ID of the microservices security group"
  value       = aws_security_group.microservice_sg.id
}

output "cassandra_sg_id" {
  description = "The ID of the Cassandra security group"
  value       = aws_security_group.cassandra_sg.id
}
