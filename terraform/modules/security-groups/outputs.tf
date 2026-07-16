output "alb_security_group_id" {
  value = aws_security_group.alb.id
}

output "eks_node_security_group_id" {
  value = aws_security_group.eks_node.id
}

output "eks_control_plane_security_group_id" {
  value = aws_security_group.eks_control_plane.id
}

output "rds_security_group_id" {
  value = aws_security_group.rds.id
}

output "efs_security_group_id" {
  value = aws_security_group.efs.id
}