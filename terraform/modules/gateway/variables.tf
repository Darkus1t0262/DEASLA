variable "subnet_id" {
  description = "Subnet ID for the API gateway"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID for the API gateway"
  type        = string
}

variable "key_name" {
  description = "Key pair for SSH access"
  type        = string
}

variable "backend_lb_dns" {
  description = "DNS of the backend Load Balancer (ALB)"
  type        = string
}
