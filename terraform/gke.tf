variable "gke_username" {
type = string
  default = "user"
  description = "GKE username"
}

variable "gke_password" {
  type = string
  default = "password"
  description = "GKE password"
}

variable "num_nodes" {
  type = number
  default = 2
  description = "Number of GKE nodes"
}

resource "google_container_cluster" "gke" {
  name = "${var.project_id}-gke"
  location = var.region
  remove_default_node_pool = true
  initial_node_count = 1
  network = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name
}
