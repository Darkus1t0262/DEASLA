provider "aws" {
  region = "us-east-1"
}

module "network" {
  source = "../modules/network"
}

module "security" {
  source            = "../modules/security"
  vpc_id            = module.network.vpc_id
  public_subnet_id  = module.network.public_subnet_id
}

module "services" {
  source        = "../modules/ec2"
  instance_name = ["user-service", "auth-service", "role-service", "profile-service", "language-service", "alert-service", "schedule-service", "template-service", "geo-service", "validation-service", "email-service", "sms-service", "push-service", "logging-service", "retry-service", "broadcast-service", "socket-service", "channel-service", "retry-engine", "notification-core", "metrics-collector", "report-generator", "audit-trail", "feedback-service", "stat-analyzer", "graphql-gateway", "webhook-service", "soap-consumer", "external-push", "channel-validator"]
  docker_image  = ["darkjus/user-service:latest", "darkjus/auth-service:latest", "darkjus/role-service:latest", "darkjus/profile-service:latest", "darkjus/language-service:latest", "darkjus/alert-service:latest", "darkjus/schedule-service:latest", "darkjus/template-service:latest", "darkjus/geo-service:latest", "darkjus/validation-service:latest", "darkjus/email-service:latest", "darkjus/sms-service:latest", "darkjus/push-service:latest", "darkjus/logging-service:latest", "darkjus/retry-service:latest", "darkjus/broadcast-service:latest", "darkjus/socket-service:latest", "darkjus/channel-service:latest", "darkjus/retry-engine:latest", "darkjus/notification-core:latest", "darkjus/metrics-collector:latest", "darkjus/report-generator:latest", "darkjus/audit-trail:latest", "darkjus/feedback-service:latest", "darkjus/stat-analyzer:latest", "darkjus/graphql-gateway:latest", "darkjus/webhook-service:latest", "darkjus/soap-consumer:latest", "darkjus/external-push:latest", "darkjus/channel-validator:latest"]
}
