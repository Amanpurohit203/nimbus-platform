variable "creation_token" {
  description = "Unique creation token for EFS"
  type        = string
}

variable "encrypted" {
  description = "Enable encryption for EFS"
  type        = bool
}

variable "performance_mode" {
  description = "EFS performance mode"
  type        = string
}

variable "throughput_mode" {
  description = "EFS throughput mode"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs"
  type        = map(string)
}

variable "efs_security_group_id" {
  description = "EFS Security Group ID"
  type        = string
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
}

variable "backup_enabled" {
  description = "Enable automatic backups for EFS"
  type        = bool
}