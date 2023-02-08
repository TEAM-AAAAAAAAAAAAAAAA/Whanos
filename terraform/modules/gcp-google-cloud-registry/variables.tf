variable "project_id" {
  type        = string
  description = "GCP project id"
}

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
  type        = string
  default     = "cavonstavant@gmail.com"
  description = "Service account email"
}

variable "ssh_user" {
  type        = string
  default     = "dev"
  description = "value for ssh user"
}

variable "ssh_private_key" {
  type        = string
  default     = "~/.ssh/id_rsa"
  description = "value for ssh private key"
}

variable "ssh_public_key" {
  type        = string
  default     = "~/.ssh/id_rsa.pub"
  description = "value for ssh public key"
}