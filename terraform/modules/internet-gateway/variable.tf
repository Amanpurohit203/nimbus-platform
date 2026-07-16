variable "vpc_id" {
  description = "ID of the VPC where the Internet Gateway will be attached"
  type        = string
}

variable "internet_gateway_name" {
  description = "Internet Gateway Name"
  type        = string
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
}