# AWS Key Pair for EC2 SSH access
variable "DEAS2" {
  description = "AWS EC2 Key Pair name for SSH access to instances"
  type        = string
}

# Database Passwords (store in .tfvars or via secrets)
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
