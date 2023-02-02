output "cluster_ip" {
  value = google_container_cluster.gke.endpoint
}

resource "local_file" "cluster_ip_file" {
  content = output.cluster_ip.value
    filename = "cluster_ip.txt"
}