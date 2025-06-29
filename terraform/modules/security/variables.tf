variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "cassandra_sg_id" {
  description = "The Security Group ID for Cassandra (used for ingress rules in microservices SG)"
  type        = string
  default     = null
}

variable "microservice_sg_id" {
  description = "The Security Group ID for microservices (used for ingress rules in Cassandra SG)"
  type        = string
  default     = null
}
