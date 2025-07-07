variable "instance_type" {
  default = "t3.small" # Updated from t2.micro to t3.small
}

variable "ami_id" {
  description = "Ubuntu AMI ID or Amazon Linux AMI ID"
  default     = "ami-0c02fb55956c7d316" # Amazon Linux 2
}
