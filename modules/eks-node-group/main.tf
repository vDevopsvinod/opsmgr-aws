data "aws_ssm_parameter" "eks_nodegroup_release_version" {
  name = "/aws/service/eks/optimized-ami/${var.cluster_version}/amazon-linux-2/recommended/release_version"
}

resource "aws_eks_node_group" "this" {
  cluster_name     = var.cluster_name
  node_group_name  = var.node_group_name
  node_role_arn    = var.node_role_arn
  subnet_ids       = var.subnet_ids
  release_version  = data.aws_ssm_parameter.eks_nodegroup_release_version.value

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  instance_types = var.instance_types
  disk_size      = var.disk_size

  tags = merge({
    Name = var.node_group_name
  }, var.tags)

  depends_on = [var.node_role_arn]
}
