module "vpc" {
  source = "../../modules/vpc"

  vpc_name                 = var.project_name
  vpc_cidr             = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = var.tags
}

module "subnets" {
  source = "../../modules/subnets"

  vpc_id          = module.vpc.vpc_id
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  tags = var.tags
}

module "internet_gateway" {
  source = "../../modules/internet-gateway"

  vpc_id = module.vpc.vpc_id

  tags = var.tags
}

module "nat_gateway" {
  source = "../../modules/nat-gateway"

  public_subnet_ids = module.subnets.public_subnet_ids

  tags = merge(
  var.tags,
  {
    Name = "${var.project_name}-${var.environment}-${each.key}"
  }
)
}
module "route_tables" {
  source = "../../modules/route-tables"

  vpc_id = module.vpc.vpc_id

  internet_gateway_id = module.internet_gateway.internet_gateway_id

  nat_gateway_ids = module.nat_gateway.nat_gateway_ids

  public_subnet_ids  = module.subnets.public_subnet_ids
  private_subnet_ids = module.subnets.private_subnet_ids

  tags = var.tags
}
module "security_groups" {
  source = "../../modules/security-groups"

  vpc_id = module.vpc.vpc_id

  tags = var.tags
}
module "iam" {
  source = "../../modules/IAM"

  cluster_role_name = var.cluster_role_name
  node_role_name    = var.node_role_name

  tags = var.tags
}

module "eks" {
  source = "../../modules/eks"

  cluster_name       = var.cluster_name
  kubernetes_version = var.kubernetes_version

  cluster_role_arn = module.iam.eks_cluster_role_arn
  node_role_arn    = module.iam.eks_node_role_arn

  subnet_ids         = concat(module.subnets.public_subnet_ids, module.subnets.private_subnet_ids)
  private_subnet_ids = module.subnets.private_subnet_ids

  eks_control_plane_security_group_id = module.security_groups.eks_control_plane_sg_id

  node_group_name     = var.node_group_name
  node_instance_types = var.node_instance_types

  desired_size = var.desired_size
  min_size     = var.min_size
  max_size     = var.max_size

  tags = var.tags
}