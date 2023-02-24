variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "region" {
  type        = string
  description = "GCP region"
}

variable "vpc" {
  type = object({
    network_name = string
    subnet_name  = string
  })
}

variable "service_account_email" {
  type        = string
  default     = ""
  description = "value for service account email"
}

variable "private_key" {
  type        = string
  default     = "~/.ssh/id_rsa"
  description = "value for private key"
}

variable "user" {
  type        = string
  default     = "deploy"
  description = "value for user"
}