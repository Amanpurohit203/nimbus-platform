output "public_subnet_ids" {
  value = {
    for key, subnet in aws_subnet.public :
    key => subnet.id
  }
}

output "private_subnet_ids" {
  value = {
    for key, subnet in aws_subnet.private :
    key => subnet.id
  }
}
output "public_subnet_arns" {
  value = values(aws_subnet.public)[*].arn
}

output "private_subnet_arns" {
  value = values(aws_subnet.private)[*].arn
}