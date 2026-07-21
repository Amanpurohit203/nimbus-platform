resource "aws_efs_file_system" "this" {

  creation_token = var.creation_token

  encrypted = var.encrypted

  performance_mode = var.performance_mode

  throughput_mode = var.throughput_mode

  tags = merge(
    var.tags,
    {
      Name = var.creation_token
    }
  )
}

resource "aws_efs_backup_policy" "this" {

  file_system_id = aws_efs_file_system.this.id

  backup_policy {
    status = var.backup_enabled ? "ENABLED" : "DISABLED"
  }
}

resource "aws_efs_mount_target" "this" {

  for_each = var.private_subnet_ids

  file_system_id = aws_efs_file_system.this.id

  subnet_id = each.value

  security_groups = [
    var.efs_security_group_id
  ]
}