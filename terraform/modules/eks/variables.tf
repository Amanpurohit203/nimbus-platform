variable "cluster_name" {
  description = "Name of the EKS Cluster"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
}

variable "cluster_role_arn" {
  description = "IAM Role ARN for EKS Control Plane"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs"
  type        = list(string)
}

variable "eks_control_plane_security_group_id" {
  description = "EKS Control Plane Security Group ID"
  type        = string
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
}

variable "node_role_arn" {
  description = "IAM Role ARN for EKS Worker Nodes"
  type        = string
}

variable "node_group_name" {
  description = "Managed Node Group Name"
  type        = string
}

variable "node_instance_types" {
  description = "EC2 instance types"
  type        = list(string)
}

variable "desired_size" {
  type = number
}

variable "min_size" {
  type = number
}

variable "max_size" {
  type = number
}

variable "subnet_ids" {
  description = "Subnets for EKS Control Plane"
  type        = list(string)
}