# =====================
# NETWORK OUTPUTS
# =====================

output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnet_ids" {
  value = module.network.public_subnet_ids
}

# =====================
# SECURITY OUTPUTS
# =====================

output "security_group_id" {
  value = module.security.security_group_id
}

# =====================
# LOAD BALANCER OUTPUT
# =====================

output "alb_dns_name" {
  value = module.alb.dns_name
}

# =====================
# API GATEWAY OUTPUTS
# =====================

output "api_gateway_public_ip" {
  value = module.api_gateway.public_ip
}

output "api_gateway_private_ip" {
  value = module.api_gateway.private_ip
}

# =====================
# DATABASE OUTPUTS
# =====================

output "postgres_endpoint" {
  value = module.postgres.endpoint
}

output "mongo_public_ip" {
  value = module.mongo.public_ip
}

output "redis_endpoint" {
  value = module.redis.endpoint
}

output "neo4j_public_ip" {
  value = module.neo4j.public_ip
}

output "cassandra_public_ip" {
  value = module.cassandra.public_ip
}

# ===============================
# MICROSERVICE INSTANCE OUTPUTS
# ===============================

# First 5 instances are for microservices
output "service_instance_public_ips" {
  value = slice(module.services.instance_public_ips, 0, 5)
}

# Labeled for easier use in Postman
output "named_service_ips" {
  value = {
    group_1 = module.services.instance_public_ips[0]
    group_2 = module.services.instance_public_ips[1]
    group_3 = module.services.instance_public_ips[2]
    group_4 = module.services.instance_public_ips[3]
    group_5 = module.services.instance_public_ips[4]
  }
}
