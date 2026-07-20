output "efs_id" {
  description = "EFS File System ID"
  value       = aws_efs_file_system.this.id
}

output "efs_arn" {
  description = "EFS File System ARN"
  value       = aws_efs_file_system.this.arn
}

output "efs_dns_name" {
  description = "EFS DNS Name"
  value       = aws_efs_file_system.this.dns_name
}

output "mount_target_ids" {
  description = "EFS Mount Target IDs"
  value = {
    for key, mount_target in aws_efs_mount_target.this :
    key => mount_target.id
  }
}