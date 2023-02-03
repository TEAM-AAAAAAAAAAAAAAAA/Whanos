output "cluster_ip" {
  value = google_container_cluster.gke.endpoint
}