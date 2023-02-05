output "cluster_ip" {
  value = google_container_cluster.gke.endpoint
}

output "cluster_name" {
  value = google_container_cluster.gke.name
}

output "cluster_ca_certificate" {
  value = google_container_cluster.gke.master_auth.0.cluster_ca_certificate
}
