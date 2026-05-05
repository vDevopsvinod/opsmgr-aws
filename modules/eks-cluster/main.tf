resource "aws_eks_cluster" "this" {
  name            = var.cluster_name
  version         = var.cluster_version
  role_arn        = var.role_arn
  vpc_config {
    subnet_ids              = var.subnet_ids
    security_groups         = var.vpc_security_group_ids
    endpoint_private_access = true
    endpoint_public_access  = true
  }

  depends_on = [var.role_arn]

  tags = merge({
    Name = var.cluster_name
  }, var.tags)
}

resource "aws_cloudwatch_log_group" "eks_cluster" {
  name              = "/aws/eks/${var.cluster_name}/cluster"
  retention_in_days = 7

  tags = merge({
    Name = "${var.cluster_name}-logs"
  }, var.tags)
}
