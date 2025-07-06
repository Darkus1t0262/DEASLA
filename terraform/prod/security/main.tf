module "security" {
  source = "../../modules/security"

  vpc_id = "${var.vpc_id}"
}