variable "identifier" {
  description = "Name tag for the Cassandra instance"
  type        = string
  default     = "deas-cassandra"
}

variable "subnet_id" {
  description = "Subnet ID to deploy into"
  type        = string
  default     = "subnet-xxxxxxxx"  # replace with a valid subnet ID from your environment
}

variable "db_sg_id" {
  description = "Security group ID for Cassandra"
  type        = string
  default     = "sg-0948cf193946285f8"  # replace with the SG you created manually
}

variable "key_name" {
  description = "SSH key pair for EC2"
  type        = string
  default     = "deas-key3.pem"
}

variable "db_user" {
  description = "Cassandra user"
  type        = string
  default     = "cassandra"
}

variable "db_password" {
  description = "Cassandra password"
  type        = string
  default     = "securepasscassandra123"
}
