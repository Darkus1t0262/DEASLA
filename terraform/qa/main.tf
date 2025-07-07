provider "aws" {
  region = "us-east-1"
}

module "network" {
  source = "../modules/network"
}

module "security" {
  source            = "../modules/security"
  vpc_id            = module.network.vpc_id
  public_subnet_ids = module.network.public_subnet_ids
}

module "services" {
  source            = "../modules/ec2"
  instance_name     = [
    "group-1", "group-2", "group-3", "group-4", "group-5",
    "postgres-node", "mongo-node", "neo4j-node", "cassandra-node"
  ]

  docker_images = [
    ["darkjus/user-service:latest", "darkjus/auth-service:latest", "darkjus/role-service:latest", "darkjus/profile-service:latest", "darkjus/language-service:latest", "darkjus/alert-service:latest"],
    ["darkjus/schedule-service:latest", "darkjus/template-service:latest", "darkjus/geo-service:latest", "darkjus/validation-service:latest", "darkjus/email-service:latest", "darkjus/sms-service:latest"],
    ["darkjus/push-service:latest", "darkjus/logging-service:latest", "darkjus/retry-service:latest", "darkjus/broadcast-service:latest", "darkjus/socket-service:latest", "darkjus/channel-service:latest"],
    ["darkjus/retry-engine:latest", "darkjus/notification-core:latest", "darkjus/metrics-collector:latest", "darkjus/report-generator:latest", "darkjus/audit-trail:latest", "darkjus/feedback-service:latest"],
    ["darkjus/stat-analyzer:latest", "darkjus/graphql-gateway:latest", "darkjus/webhook-service:latest", "darkjus/soap-consumer:latest", "darkjus/external-push:latest", "darkjus/channel-validator:latest"],
    [], [], [], [] # These are the database nodes
  ]

  public_subnet_ids = module.network.public_subnet_ids
  security_group_id = module.security.security_group_id
}

module "alb" {
  source            = "../modules/alb"
  vpc_id            = module.network.vpc_id
  public_subnet_ids = module.network.public_subnet_ids
  security_group_id = module.security.security_group_id
}

# ===========================
# === DATABASES SECTION ====
# ===========================

module "postgres" {
  source         = "../modules/databases/postgres"
  identifier     = "deasla-postgres"
  db_name        = "deaslapg"
  db_user        = "deaslaadmin"
  db_password    = var.pg_password
  db_sg_id       = module.security.security_group_id
}

module "mongo" {
  source         = "../modules/databases/mongo"
  identifier     = "deasla-mongo"
  db_user        = "mongoadmin"
  db_password    = var.mongo_password
  db_sg_id       = module.security.security_group_id
  subnet_id      = module.network.public_subnet_ids[0]
  key_name       = var.key_name
}

module "redis" {
  source         = "../modules/databases/redis"
  identifier     = "deasla-redis"
  db_sg_id       = module.security.security_group_id
  subnet_ids     = module.network.public_subnet_ids
}

module "neo4j" {
  source         = "../modules/databases/neo4j"
  identifier     = "deasla-neo4j"
  db_user        = "neo4jadmin"
  db_password    = var.neo4j_password
  db_sg_id       = module.security.security_group_id
  subnet_id      = module.network.public_subnet_ids[0]
  key_name       = var.key_name
}

module "cassandra" {
  source         = "../modules/databases/cassandra"
  identifier     = "deasla-cassandra"
  db_user        = "cassandra"
  db_password    = var.cassandra_password
  db_sg_id       = module.security.security_group_id
  subnet_id      = module.network.public_subnet_ids[0]
  key_name       = var.key_name
}

# ===============================
# === API GATEWAY SECTION =======
# ===============================

module "api_gateway" {
  source            = "../modules/gateway"
  subnet_id         = module.network.public_subnet_ids[0]
  security_group_id = module.security.security_group_id
  key_name          = var.key_name
  backend_lb_dns    = module.alb.dns_name
}
