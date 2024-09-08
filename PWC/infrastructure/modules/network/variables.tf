variable "project_name" {
  description = "Project name the will be used to create resources and tags"
}

variable "module" {
  description = "Module name that is used to label resources"
  default = "network"
}

variable "aws_region" {
  description = "AWS region will deploy infra on it"
}