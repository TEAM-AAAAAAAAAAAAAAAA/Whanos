terraform {
  required_version = ">= 0.14"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.27"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 1.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

provider "kubernetes" {
  host                   = google_container_cluster.primary.endpoint
  username               = var.gke_username
  password               = var.gke_password
  client_certificate     = google_container_cluster.primary.master_auth.0.client_certificate
  client_key             = google_container_cluster.primary.master_auth.0.client_key
  cluster_ca_certificate = google_container_cluster.primary.master_auth.0.cluster_ca_certificate
}

module "gcp_google_cloud_registry" {
  source     = "./modules/gcp-google-cloud-registry"
  region     = var.region
  project_id = var.project_id
}

module "gcp_google_kubernetes_engine" {
  source      = "./modules/gcp-google-kubernetes-engine"
  region      = var.region
  project_id  = var.project_id
  vpc_name    = module.gcp_vpc.vpc_id
  subnet_name = module.gcp_vpc.subnet_id
}

module "gcp_vpc" {
  source     = "./modules/gcp-vpc"
  region     = var.region
  project_id = var.project_id
}

module "gcp_compute_instance" {
  source     = "./modules/gcp-compute-instance"
  region     = var.region
  project_id = var.project_id
  vpc = {
    network_name = module.gcp_vpc.vpc_network_name
    subnet_name  = module.gcp_vpc.vpc_subnet_name
  }
  user = var.user
  private_key = var.private_key
  service_account_email = var.service_account_email
}

resource "local_file" "cluster_ip_file" {
  content  = module.gcp_google_kubernetes_engine.cluster_ip
  filename = "../cluster_ip.txt"
}

resource "local_file" "ansible_inventory" {
  content = templatefile("inventory.tpl",
    {
        JENKINS_GCP_INSTANCE_IP = module.gcp_compute_instance.jenkins_ip
    }
  )
  filename = "../inventory.ini"
}

resource "local_file" "cluster_ca_certificate" {
  content  = module.gcp_google_kubernetes_engine.cluster_ca_certificate
  filename = "../cluster_ca_certificate.txt"
}
