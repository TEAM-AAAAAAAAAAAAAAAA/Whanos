output "jenkins_ip" {
  value       = google_compute_address.jenkins_static_ip.address
  description = "value of jenkins_ip"
}