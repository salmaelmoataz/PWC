provider "aws" {
  region = var.aws_region
}

module "network" {
  source       = "./modules/network"
  project_name = var.project_name
  aws_region   = var.aws_region
}

module "app" {
  depends_on        = [module.network]
  source            = "./modules/app"
  project_name      = var.project_name
  public_subnet_id  = module.network.public_subnet_id2
  private_subnet_id = module.network.private_subnet_id
}