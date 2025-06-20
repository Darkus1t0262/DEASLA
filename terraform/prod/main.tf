provider "aws" {
  region = var.region
}

module "vpc" {
  source = "../modules/network"
}

module "security" {
  source = "../modules/security"
}

module "alb" {
  source = "../modules/alb"
}

module "asg" {
  source = "../modules/asg"
}

module "services" {
  source = "../modules/ec2"
}
