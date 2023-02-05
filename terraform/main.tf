terraform {
  required_version = ">= 0.14"
  required_providers {
      google = {
          source = "hashicorp/google"
          version = ">= 4.27"
      }
      kubernetes = {
          source = "hashicorp/kubernetes"
          version = ">= 1.0"
      }
  }
}

provider "google" {
  project = var.project_id
  region = var.region
}

provider "kubernetes" {
  host = google_container_cluster.primary.endpoint
  username = var.gke_username
  password = var.gke_password
  client_certificate = google_container_cluster.primary.master_auth.0.client_certificate
  client_key = google_container_cluster.primary.master_auth.0.client_key
  cluster_ca_certificate = google_container_cluster.primary.master_auth.0.cluster_ca_certificate
}

module "gcp-google-cloud-registry" {
  source = "./modules/gcp-google-cloud-registry"
  region = var.region
  project_id = var.project_id
}

module "gcp-google-kubernetes-engine" {
  source = "./modules/gcp-google-kubernetes-engine"
  region = var.region
  project_id = var.project_id
  vpc_name = module.gcp-vpc.vpc_id
  subnet_name = module.gcp-vpc.subnet_id
}

module "gcp-vpc" {
  source = "./modules/gcp-vpc"
  region = var.region
  project_id = var.project_id
}

resource "local_file" "cluster_ip_file" {
  content = module.gcp-google-kubernetes-engine.cluster_ip
  filename = "../cluster_ip.txt"
}

resource "local_file" "cluster_ca_certificate" {
  content = module.gcp-google-kubernetes-engine.cluster_ca_certificate
  filename = "../cluster_ca_certificate.txt"
}