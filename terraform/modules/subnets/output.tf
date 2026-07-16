output "public_subnet_ids" {
  value = values(aws_subnet.public)[*].id
}

output "private_subnet_ids" {
  value = values(aws_subnet.private)[*].id
}

output "public_subnet_arns" {
  value = values(aws_subnet.public)[*].arn
}

output "private_subnet_arns" {
  value = values(aws_subnet.private)[*].arn
}