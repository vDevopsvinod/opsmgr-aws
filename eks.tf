module "eks_cluster" {
  source = "./modules/eks-cluster"

  cluster_name    = var.eks_cluster_name
  cluster_version = var.eks_cluster_version
  role_arn        = module.eks_iam_roles.cluster_role_arn
  subnet_ids      = concat(module.vpc.public_subnet_ids, module.vpc.private_subnet_ids)

  vpc_security_group_ids = [module.eks_security_groups.cluster_security_group_id]

  tags = var.tags
}

module "eks_node_group" {
  source = "./modules/eks-node-group"

  cluster_name           = module.eks_cluster.cluster_name
  node_group_name        = var.node_group_name
  node_role_arn          = module.eks_iam_roles.node_role_arn
  subnet_ids             = module.vpc.private_subnet_ids
  desired_size           = var.node_desired_size
  min_size               = var.node_min_size
  max_size               = var.node_max_size
  instance_types         = var.node_instance_types
  disk_size              = var.node_disk_size
  security_group_ids     = [module.eks_security_groups.node_security_group_id]

  tags = var.tags
}

module "eks_iam_roles" {
  source = "./modules/eks-iam"

  cluster_name = var.eks_cluster_name
  tags         = var.tags
}

module "eks_security_groups" {
  source = "./modules/eks-security-groups"

  vpc_id           = module.vpc.vpc_id
  cluster_name     = var.eks_cluster_name
  tags             = var.tags
}
