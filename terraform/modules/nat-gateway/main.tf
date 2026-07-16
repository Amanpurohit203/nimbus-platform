resource "aws_nat_gateway" "this" {

  for_each = var.public_subnet_ids

  subnet_id     = each.value
  allocation_id = var.allocation_ids[each.key]

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-${var.environment}-nat-${each.key}"
    }
  )
}

