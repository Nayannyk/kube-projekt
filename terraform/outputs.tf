output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  value = module.eks.cluster_security_group_id
}

output "node_group_role_arn" {
  value = module.eks.eks_managed_node_groups["default"].iam_role_arn
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

