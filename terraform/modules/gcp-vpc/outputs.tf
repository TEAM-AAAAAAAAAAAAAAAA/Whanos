output "vpc_id" {
  value       = google_compute_network.vpc.id
  description = "value of vpc_id"
}

output "subnet_id" {
  value       = google_compute_subnetwork.subnet.id
  description = "value of subnet_id"
}

output "vpc_network_name" {
  value = google_compute_network.vpc.name
  description = "value of vpc_network_name"
}

output "vpc_subnet_name" {
  value = google_compute_subnetwork.subnet.name
  description = "value of vpc_subnet_name"
}