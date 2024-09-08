module "ecr" {
  source       = "../../submodules/ecr"
  project_name = var.project_name
  repo_name    = "eks"
}

module "eks" {
  source            = "../../submodules/eks"
  project_name      = var.project_name
  module            = var.module
  public_subnet_id  = var.public_subnet_id
  private_subnet_id = var.private_subnet_id
}