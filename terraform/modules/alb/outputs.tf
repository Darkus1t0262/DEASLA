output "target_group_arns" {
  value = aws_lb_target_group.services[*].arn
}

output "listener_arn" {
  value = aws_lb_listener.http.arn
}
