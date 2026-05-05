output "eks_cluster_name" {
  description = "Name of the EKS cluster"
  value       = module.eks_cluster.cluster_name
}

output "eks_cluster_endpoint" {
  description = "Endpoint of the EKS cluster"
  value       = module.eks_cluster.cluster_endpoint
}

output "eks_cluster_security_group_id" {
  description = "Security group ID of the EKS cluster"
  value       = module.eks_security_groups.cluster_security_group_id
}

output "eks_node_group_id" {
  description = "ID of the EKS node group"
  value       = module.eks_node_group.node_group_id
}
