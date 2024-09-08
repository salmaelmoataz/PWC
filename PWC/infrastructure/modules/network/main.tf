# Network[VPC-Subnets-....]
module "vpc" {
  source             = "../../submodules/vpc"
  project_name       = var.project_name
  module             = var.module
  cidr               = "10.0.0.0/16"
  private_subnet     = "10.0.1.0/24"
  public_subnet      = "10.0.2.0/24"
  public_subnet2     = "10.0.3.0/24"
  availability_zone  = "${var.aws_region}a"
  availability_zone2 = "${var.aws_region}b"
}
