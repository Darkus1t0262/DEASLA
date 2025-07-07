variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnets to attach the ALB"
  type        = list(string)
}