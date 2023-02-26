variable "project_id" {
  type        = string
  description = "GCP project id"
}
variable "region" {
  type        = string
  description = "GCP region"
}

variable "user" {
  type        = string
  description = "GCP user"
}

variable "service_account_email" {
  type        = string
  description = "GCP service account email"
}

variable "ssh_public_key_path" {
  type        = string
  description = "path to ssh public key"
}
