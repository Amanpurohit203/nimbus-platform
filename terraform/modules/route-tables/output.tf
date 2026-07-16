output "public_route_table_id" {
  description = "Public Route Table ID"
  value       = aws_route_table.public.id
}

output "private_route_table_ids" {
  description = "Private Route Table IDs"

  value = {
    for key, rt in aws_route_table.private :
    key => rt.id
  }
}