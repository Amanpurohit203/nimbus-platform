module "vpc" {
  source = "../../modules/vpc"

  vpc_name             = var.project_name
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
  cluster_name    = "${var.project_name}-${var.environment}-eks"
  name_prefix     = "${var.project_name}-${var.environment}"
  tags            = var.tags
}

module "internet_gateway" {
  source = "../../modules/internet-gateway"

  vpc_id                = module.vpc.vpc_id
  internet_gateway_name = "${var.project_name}-${var.environment}-igw"

  tags = var.tags
}

module "elastic_ip" {
  source      = "../../modules/elstic-ip"
  elastic_ips = var.elastic_ips

  tags = var.tags
}

module "nat_gateway" {
  source = "../../modules/nat-gateway"

  project_name = var.project_name

  public_subnet_ids = module.subnets.public_subnet_ids

  allocation_ids = module.elastic_ip.allocation_ids

  environment = var.environment

  tags = merge(
    var.tags,
    {
      Project     = var.project_name
      Environment = var.environment
    }
  )
}
module "route_tables" {
  source = "../../modules/route-tables"

  vpc_id = module.vpc.vpc_id

  internet_gateway_id = module.internet_gateway.internet_gateway_id

  nat_gateway_ids = {
    private-1 = module.nat_gateway.nat_gateway_ids["public-1"]
    private-2 = module.nat_gateway.nat_gateway_ids["public-2"]
  }

  public_subnet_ids       = module.subnets.public_subnet_ids
  private_subnet_ids      = module.subnets.private_subnet_ids
  public_route_table_name = "${var.project_name}-${var.environment}-public-rt"
  private_route_table_name = {
    "private-1" = "${var.project_name}-${var.environment}-private-rt-1"
    "private-2" = "${var.project_name}-${var.environment}-private-rt-2"
  }

  tags = var.tags
}
module "security_groups" {
  source = "../../modules/security-groups"

  vpc_id = module.vpc.vpc_id

  eks_control_plane_security_group_name = "${var.project_name}-${var.environment}-eks-control-plane-sg"

  eks_node_security_group_name = "${var.project_name}-${var.environment}-eks-node-sg"

  alb_security_group_name = "${var.project_name}-${var.environment}-alb-sg"

  efs_security_group_name = "${var.project_name}-${var.environment}-efs-sg"

  rds_security_group_name = "${var.project_name}-${var.environment}-rds-sg"

  tags = var.tags
}
module "iam" {
  source = "../../modules/IAM"

  cluster_role_name = var.cluster_role_name
  node_role_name    = var.node_role_name
  oidc_provider_arn = module.oidc_provider.oidc_provider_arn

  oidc_provider_url = module.oidc_provider.oidc_provider_url

  irsa_roles = var.irsa_roles



  tags = var.tags
}

module "eks" {
  source = "../../modules/eks"

  cluster_name       = var.cluster_name
  kubernetes_version = var.kubernetes_version

  cluster_role_arn = module.iam.eks_cluster_role_arn
  node_role_arn    = module.iam.eks_node_role_arn

  subnet_ids = concat(
    values(module.subnets.public_subnet_ids),
    values(module.subnets.private_subnet_ids)
  )
  private_subnet_ids = values(module.subnets.private_subnet_ids)

  eks_control_plane_security_group_id = module.security_groups.eks_control_plane_security_group_id

  node_group_name     = var.node_group_name
  node_instance_types = var.node_instance_types

  desired_size = var.desired_size
  min_size     = var.min_size
  max_size     = var.max_size

  tags = var.tags
}

module "efs" {
  source = "../../modules/efs"

  creation_token = "${var.project_name}-${var.environment}-efs"

  encrypted        = var.encrypted
  performance_mode = var.performance_mode
  throughput_mode  = var.throughput_mode
  backup_enabled   = var.backup_enabled

  vpc_id = module.vpc.vpc_id

  private_subnet_ids = module.subnets.private_subnet_ids

  efs_security_group_id = module.security_groups.efs_security_group_id

  tags = var.tags
}

module "oidc_provider" {

  source = "../../modules/oidc-provider"

  oidc_issuer_url = module.eks.cluster_oidc_issuer_url

  tags = var.tags
}


module "helm_efs_csi" {

  source = "../../modules/helm"

  release_name     = var.helm_release_name
  repository       = var.helm_repository
  chart            = var.helm_chart
  chart_version    = var.helm_chart_version
  namespace        = var.helm_namespace
  create_namespace = var.helm_create_namespace

  set_values = concat(

    var.helm_set_values,

    [

      {
        name  = "controller.serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
        value = module.iam.role_arns["efs-csi"]
      }

    ]

  )

}