variable "vpc_id" {
  type        = string
  description = "The VPC ID"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnets for the Auto Scaling Group"
}

variable "alb_target_group_arn" {
  type        = string
  description = "Target Group ARN for ALB"
}

variable "instance_type" {
  default     = "t3.small"
  description = "EC2 instance type"
}

variable "ami_id" {
  description = "AMI ID to use for launch template"
  type        = string
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security groups to attach"
}