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

output "oidc_provider_arn" {
  value = module.oidc_provider.oidc_provider_arn
}

output "oidc_provider_url" {
  value = module.oidc_provider.oidc_provider_url
}

output "node_group_name" {
  description = "Managed Node Group Name"
  value       = module.eks.node_group_name
}

output "efs_id" {
  value = module.efs.efs_id
}

output "efs_dns_name" {
  value = module.efs.efs_dns_name
}

output "rds_endpoint" {
  value = module.rds.endpoint
}

output "rds_address" {
  value = module.rds.address
}

output "generated_db_password" {
  value     = module.db_password.password
  sensitive = true
}

output "database_secret_name" {
  value = module.database_secret.secret_name
}

output "database_secret_arn" {
  value = module.database_secret.secret_arn
}