variable "vpc_id" {
  description = "The VPC ID to launch the bastion host in"
  type        = string
}

variable "public_subnet_id" {
  description = "The public subnet to launch the bastion host in"
  type        = string
}
