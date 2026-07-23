variable "elastic_ips" {
  description = "Elastic IPs to create"

  type = map(object({
    name = string
  }))
}


variable "tags" {
  description = "Common tags"
  type        = map(string)
}