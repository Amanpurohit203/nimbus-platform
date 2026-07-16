variable "vpc_id" {
  description = "VPC ID where Security Groups will be created"
  type        = string
}

variable "tags" {
  description = "Common tags applied to all Security Groups"
  type        = map(string)
}

variable "alb_security_group_name" {
  description = "Name of the ALB Security Group"
  type        = string
}

variable "eks_node_security_group_name" {
  description = "Name of the EKS Node Security Group"
  type        = string
}

variable "eks_control_plane_security_group_name" {
  description = "Name of the EKS Control Plane Security Group"
  type        = string
}

variable "rds_security_group_name" {
  description = "Name of the RDS Security Group"
  type        = string
}

variable "efs_security_group_name" {
  description = "Name of the EFS Security Group"
  type        = string
}
