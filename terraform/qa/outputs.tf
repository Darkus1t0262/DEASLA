# Network Outputs
output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnet_ids" {
  value = module.network.public_subnet_ids
}

# Security
output "security_group_id" {
  value = module.security.security_group_id
}

# ALB
output "alb_dns_name" {
  value = module.alb.dns_name
}

# API Gateway
output "api_gateway_public_ip" {
  value = module.api_gateway.public_ip
}

output "api_gateway_private_ip" {
  value = module.api_gateway.private_ip
}

# PostgreSQL
output "postgres_endpoint" {
  value = module.postgres.endpoint
}

# MongoDB
output "mongo_public_ip" {
  value = module.mongo.public_ip
}

# Redis
output "redis_endpoint" {
  value = module.redis.endpoint
}

# Neo4j
output "neo4j_public_ip" {
  value = module.neo4j.public_ip
}

# Cassandra
output "cassandra_public_ip" {
  value = module.cassandra.public_ip
}
