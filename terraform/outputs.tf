output "vpc_ip" {
  value       = module.gcp_vpc.vpc_id
  description = "value of vpc_id"
}

output "cluster_ip" {
  value       = module.gcp_google_kubernetes_engine.cluster_ip
  description = "value of cluster_ip"
}

output "cluster_ca_certificate" {
  value       = module.gcp_google_kubernetes_engine.cluster_ca_certificate
  description = "value of cluster_ca_certificate"
}

output "cluster_name" {
  value       = module.gcp_google_kubernetes_engine.cluster_name
  description = "value of cluster_name"
}

output "jenkins_ip" {
  value       = module.gcp_compute_instance.jenkins_ip
  description = "value of jenkins_ip"
}