variable "project_id" {
  type = string
  description = "GCP project id"
}

variable "region" {
  type = string
  description = "GCP region"
}

provider "google" {
  project = var.project_id
  region = var.region
}