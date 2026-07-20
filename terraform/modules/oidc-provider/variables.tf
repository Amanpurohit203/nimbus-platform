variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
}