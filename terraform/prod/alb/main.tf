module "alb" {
  source             = "../../modules/alb"
  vpc_id             = var.vpc_id
  public_subnet_ids  = var.public_subnet_ids
  alb_name           = "deasla-alb-core"
}
