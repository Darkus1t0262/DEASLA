output "microservices_sg_id" {
  value = module.security.microservices_sg_id
}

output "bastion_sg_id" {
  value = module.security.bastion_sg_id
}

output "database_sg_id" {
  value = module.security.db_sg_id
}
