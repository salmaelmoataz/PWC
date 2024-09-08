variable "project_name" {
  description = "Project name the will be used to create resources and tags"
}

variable "module" {
  description = "Module name that is used to label resources"
}

variable "cidr" {
  description = "The CIDR block for the VPC"
}

variable "public_subnet" {
  description = "The CIDR block for public subnet"
}

variable "public_subnet2" {
  description = "The CIDR block for public subnet"
}

variable "private_subnet" {
  description = "The CIDR block for private subnet"
}

variable "availability_zone" {
  description = "The availability zone"
}

variable "availability_zone2" {
  description = "The availability zone"
}