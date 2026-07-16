output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Public Subnet IDs"
  value       = module.subnets.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private Subnet IDs"
  value       = module.subnets.private_subnet_ids
}

output "cluster_name" {
  description = "EKS Cluster Name"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "EKS API Endpoint"
  value       = module.eks.cluster_endpoint
}

output "cluster_oidc_issuer_url" {
  description = "OIDC Issuer URL"
  value       = module.eks.cluster_oidc_issuer_url
}

output "node_group_name" {
  description = "Managed Node Group Name"
  value       = module.eks.node_group_name
}