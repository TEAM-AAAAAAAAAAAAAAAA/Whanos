variable "project_id" {
  type = string
  description = "GCP project id"
}

variable "region" {
  type = string
  description = "GCP region"
}

variable "vpc_name" {
  type = string
  default = "vpc"
  description = "VPC name"
}

variable "subnet_name" {
  type = string
  default = "subnet"
  description = "Subnet name"
}
