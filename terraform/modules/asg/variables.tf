variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "instance_names" {
  type = list(string)
}

variable "docker_images" {
  type = list(string)
}

variable "target_group_arns" {
  type = list(string)
}

variable "alb_listener_arn" {
  type = string
}
