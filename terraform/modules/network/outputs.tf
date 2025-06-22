output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = module.network.public_subnet_ids
}
