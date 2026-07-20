variable "cluster_role_name" {
  description = "Name of the EKS Cluster IAM Role"
  type        = string
}

variable "node_role_name" {
  description = "Name of the EKS Worker Node IAM Role"
  type        = string
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
}

##################################################
# OIDC
##################################################

variable "oidc_provider_arn" {
  description = "IAM OIDC Provider ARN"
  type        = string
  default     = null
}

variable "oidc_provider_url" {
  description = "IAM OIDC Provider URL"
  type        = string
  default     = null
}

##################################################
# IRSA Roles
##################################################

variable "irsa_roles" {
  description = "Map of IRSA roles to create"

  type = map(object({
    role_name           = string
    namespace           = string
    service_account     = string
    managed_policy_arns = list(string)
    tags                = optional(map(string), {})
  }))

  default = {}
}