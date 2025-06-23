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
  instance_name     = ["group-1", "group-2", "group-3", "group-4", "group-5"]

  docker_images = [
    ["darkjus/user-service:latest", "darkjus/auth-service:latest", "darkjus/role-service:latest", "darkjus/profile-service:latest", "darkjus/language-service:latest", "darkjus/alert-service:latest"],
    ["darkjus/schedule-service:latest", "darkjus/template-service:latest", "darkjus/geo-service:latest", "darkjus/validation-service:latest", "darkjus/email-service:latest", "darkjus/sms-service:latest"],
    ["darkjus/push-service:latest", "darkjus/logging-service:latest", "darkjus/retry-service:latest", "darkjus/broadcast-service:latest", "darkjus/socket-service:latest", "darkjus/channel-service:latest"],
    ["darkjus/retry-engine:latest", "darkjus/notification-core:latest", "darkjus/metrics-collector:latest", "darkjus/report-generator:latest", "darkjus/audit-trail:latest", "darkjus/feedback-service:latest"],
    ["darkjus/stat-analyzer:latest", "darkjus/graphql-gateway:latest", "darkjus/webhook-service:latest", "darkjus/soap-consumer:latest", "darkjus/external-push:latest", "darkjus/channel-validator:latest"]
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
