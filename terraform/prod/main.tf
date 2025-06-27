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

module "alb" {
  source = "../modules/alb"
  vpc_id = module.network.vpc_id
  public_subnet_ids = module.network.public_subnet_ids
}

module "asg" {
  source              = "../modules/asg"
  vpc_id              = module.network.vpc_id
  public_subnet_ids   = module.network.public_subnet_ids
  docker_images       = ["darkjus/user-service:latest", "darkjus/alert-service:latest", "darkjus/sms-service:latest", "darkjus/report-generator:latest", "darkjus/graphql-gateway:latest"]
  instance_names      = ["user-service", "alert-service", "sms-service", "report-generator", "graphql-gateway"]
  target_group_arns   = module.alb.target_group_arns
  alb_listener_arn    = module.alb.listener_arn
}
