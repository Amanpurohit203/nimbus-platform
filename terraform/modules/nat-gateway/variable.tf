variable "public_subnet_ids" {
  description = "Public subnet IDs by Availability Zone"
  type        = map(string)
}

variable "allocation_ids" {
  description = "Elastic IP Allocation IDs by Availability Zone"
  type        = map(string)
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}