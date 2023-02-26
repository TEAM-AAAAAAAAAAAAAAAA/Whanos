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

variable "ssh_public_key_path" {
  type        = string
  default     = "~/.ssh/whanos_deployment.pub"
  description = "value for public key path"
}

variable "user" {
  type        = string
  default     = "deploy"
  description = "value for user"
}
