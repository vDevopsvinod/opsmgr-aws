output "cluster_role_arn" {
  description = "ARN of the EKS cluster IAM role"
  value       = aws_iam_role.eks_cluster_role.arn
}

output "node_role_arn" {
  description = "ARN of the EKS node IAM role"
  value       = aws_iam_role.eks_node_role.arn
}

output "node_instance_profile_arn" {
  description = "ARN of the node instance profile"
  value       = aws_iam_instance_profile.eks_node_instance_profile.arn
}
