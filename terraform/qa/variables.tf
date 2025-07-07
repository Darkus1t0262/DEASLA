# =====================
# AWS Key Pair
# =====================

variable "key_name" {
  description = "AWS EC2 Key Pair name for SSH access to instances"
  type        = string
}

# =====================
# DATABASE PASSWORDS
# =====================

variable "pg_password" {
  description = "PostgreSQL database password"
  type        = string
  sensitive   = true
}

variable "mongo_password" {
  description = "MongoDB password"
  type        = string
  sensitive   = true
}

variable "neo4j_password" {
  description = "Neo4j password"
  type        = string
  sensitive   = true
}

variable "cassandra_password" {
  description = "Cassandra password"
  type        = string
  sensitive   = true
}

# =====================
# SERVICE EC2 MODULE INPUTS
# =====================

variable "instance_name" {
  description = "List of instance names for microservices and DB nodes"
  type        = list(string)
}

variable "docker_images" {
  description = "List of Docker image groups per instance"
  type        = list(list(string))
}

