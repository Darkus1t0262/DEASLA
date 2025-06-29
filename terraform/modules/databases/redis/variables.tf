variable "identifier" {
  type        = string
  description = "Unique identifier for naming Redis EC2 instance"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs; the first one will be used for Redis EC2"
}

variable "db_sg_id" {
  type        = string
  description = "Security group ID for the Redis EC2 instance"
}

variable "key_name" {
  type        = string
  description = "Name of the EC2 Key Pair to connect via SSH (e.g., deas-key2)"
}

variable "environment" {
  type        = string
  default     = "qa"
  description = "Environment tag for all resources"
}
