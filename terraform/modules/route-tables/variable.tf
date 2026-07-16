variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "nat_gateway_ids" {
  description = "Map of NAT Gateway IDs"
  type        = map(string)
}
variable "internet_gateway_id" {
  description = "internet_gateway_id"
  type        = string
}



variable "public_subnet_ids" {
  description = "Public subnet IDs"
  type        = map(string)
}

variable "private_subnet_ids" {
  description = "Public subnet IDs"
  type        = map(string)
}

variable "public_route_table_name" {
  description = "Public Route Table Name"
  type        = string
}

variable "private_route_table_name" {
  description = "private Route Table Name"
  type        = map(string)
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
}