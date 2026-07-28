
output "eks_cluster_role_arn" {
  description = "ARN of the EKS Cluster IAM Role"
  value       = aws_iam_role.eks_cluster.arn
}

output "eks_node_role_arn" {
  description = "ARN of the EKS Worker Node IAM Role"
  value       = aws_iam_role.eks_node.arn
}

output "role_arns" {
  description = "IRSA Role ARNs"

  value = {
    for key, role in aws_iam_role.irsa :
    key => role.arn
  }
}