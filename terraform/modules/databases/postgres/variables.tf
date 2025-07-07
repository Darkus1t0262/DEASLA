variable "db_name" {
  description = "Name of the PostgreSQL database"
  type        = string
  default     = "coredb"
}

variable "db_user" {
  description = "PostgreSQL username"
  type        = string
  default     = "postgres"
}

variable "db_password" {
  description = "PostgreSQL password"
  type        = string
  default     = "securepass1223"
}

variable "key_name" {
  description = "Key pair for SSH into EC2"
  type        = string
}

variable "subnet_id" {
  description = "One subnet from the subnet_ids list"
  type        = string
}

variable "db_sg_id" {
  description = "Security group allowing port 5432"
  type        = string
}
