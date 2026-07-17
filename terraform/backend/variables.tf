variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "bucket_name" {
  description = "Terraform state bucket name"
  type        = string
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
}