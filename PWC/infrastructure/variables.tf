variable "project_name" {
  description = "Project name the will be used to create resources and tags"
  default     = "pwc"
}

variable "aws_region" {
  description = "AWS Region that will host infra on"
  default     = "us-east-1"
}