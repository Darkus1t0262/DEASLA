variable "identifier" {
  description = "Name tag for the Neo4j EC2 instance"
}

variable "db_sg_id" {
  description = "Security group ID for Neo4j"
}

variable "subnet_id" {
  description = "Subnet ID where the instance will be deployed"
}

variable "key_name" {
  description = "SSH key name to access the instance"
}

variable "db_user" {
  description = "The Neo4j database username"
  type        = string
}

variable "db_password" {
  description = "The Neo4j database password"
  type        = string
}
