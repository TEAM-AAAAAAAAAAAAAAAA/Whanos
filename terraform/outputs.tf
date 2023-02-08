output "vpc_ip" {
  value       = module.gcp-vpc
  description = "value of vpc_id"
}

output "cluster_ip" {
  value       = module.gcp-google-kubernetes-engine.cluster_ip
  description = "value of cluster_ip"
}

output "cluster_ca_certificate" {
  value       = module.gcp-google-kubernetes-engine.cluster_ca_certificate
  description = "value of cluster_ca_certificate"
}

output "cluster_name" {
  value       = module.gcp-google-kubernetes-engine.cluster_name
  description = "value of cluster_name"
}
