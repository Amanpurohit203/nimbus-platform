variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "project_name" {
  description = "Project Name"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}

variable "tags" {
  description = "Common Tags"
  type        = map(string)
}
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "public_subnets" {
  description = "Public subnet configuration"

  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "private_subnets" {
  description = "Private subnet configuration"

  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "cluster_role_name" {
  description = "EKS Cluster IAM Role Name"
  type        = string
}

variable "node_role_name" {
  description = "EKS Worker Node IAM Role Name"
  type        = string
}

variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes Version"
  type        = string
}

variable "node_group_name" {
  description = "Managed Node Group Name"
  type        = string
}

variable "node_instance_types" {
  description = "EC2 Instance Types"
  type        = list(string)
}

variable "desired_size" {
  description = "Desired number of worker nodes"
  type        = number
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  type        = number
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  type        = number
}