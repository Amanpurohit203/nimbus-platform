variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for resource names"
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

variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
}