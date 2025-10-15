output "cluster_name" {
  value = module.eks.cluster_id
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "kubeconfig_certificate_authority_data" {
  value = module.eks.cluster_certificate_authority_data
}

output "kubeconfig" {
  description = "Kubeconfig snippet that can be combined into a kubeconfig file."
  value = module.eks.cluster_kubeconfig
}

output "node_group_names" {
  value = keys(module.eks.node_groups)
}

