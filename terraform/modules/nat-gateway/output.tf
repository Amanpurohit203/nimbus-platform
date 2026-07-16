output "nat_gateway_ids" {
  description = "NAT Gateway IDs"

  value = {
    for key, nat in aws_nat_gateway.this :
    key => nat.id
  }
}

output "nat_gateway_public_ips" {
  description = "NAT Gateway Public IPs"

  value = {
    for key, nat in aws_nat_gateway.this :
    key => nat.public_ip
  }
}