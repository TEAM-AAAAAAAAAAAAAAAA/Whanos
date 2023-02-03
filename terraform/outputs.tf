output "vpc_ip" {
  value = module.gcp-vpc
  description = "value of vpc_id"
}

output "cluster_ip" {
  value = module.gcp-google-kubernetes-engine.cluster_ip
  description = "value of cluster_ip"
}