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

variable "private_key" {
  type = string
  description = "private key for service account"
}
