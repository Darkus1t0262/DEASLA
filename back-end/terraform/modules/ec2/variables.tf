variable "instance_name" {
  type = list(string)
}

variable "docker_images" {
  description = "List of Docker image groups per instance"
  type        = list(list(string))
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "security_group_id" {
  type = string
}
