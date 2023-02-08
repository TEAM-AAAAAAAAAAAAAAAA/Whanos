variable "region" {
  type        = string
  description = "GCP region"
}

variable "vpc_name" {
  type        = string
  default     = "vpc"
  description = "VPC name"
}

variable "service_account_email" {
  type = string
  default = ""
  description = "value for service account email"
}

