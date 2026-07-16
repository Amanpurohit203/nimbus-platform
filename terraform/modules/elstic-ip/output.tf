output "allocation_ids" {
  description = "Elastic IP allocation IDs"

  value = {
    for key, eip in aws_eip.this :
    key => eip.id
  }
}

output "public_ips" {
  description = "Elastic IP public addresses"

  value = {
    for key, eip in aws_eip.this :
    key => eip.public_ip
  }
}