---

output "vpc_id" {
    value = google_compute_network.vpc.id
    description = "value of vpc_id"
}

output "subnet_id" {
    value = google_compute_subnetwork.subnet.id
    description = "value of subnet_id"
}
