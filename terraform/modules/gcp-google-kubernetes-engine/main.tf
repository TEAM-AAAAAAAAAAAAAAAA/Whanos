variable "gke_username" {
  type        = string
  default     = "user"
  description = "GKE username"
}

variable "gke_password" {
  type        = string
  default     = "password"
  description = "GKE password"
}

variable "num_nodes" {
  type        = number
  default     = 2
  description = "Number of GKE nodes"
}

resource "google_container_cluster" "gke" {
  name                     = "${var.project_id}-gke"
  location                 = var.region
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = var.vpc_name
  subnetwork               = var.subnet_name
}

resource "google_container_node_pool" "gke_node_pool" {
  name       = google_container_cluster.gke.name
  location   = var.region
  cluster    = google_container_cluster.gke.name
  node_count = var.num_nodes
  node_config {
    machine_type = "e2-micro"
    spot         = true
    disk_size_gb = 10
    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/trace.append"
    ]
    labels = {
      env = var.project_id
    }
    tags = [
      "${var.project_id}", "gke-node"
    ]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}
