resource "aws_route_table" "public" {

  vpc_id = var.vpc_id

  tags = merge(
    var.tags,
    {
      Name = var.public_route_table_name
    }
  )
}

resource "aws_route" "internet_access" {

  route_table_id = aws_route_table.public.id

  destination_cidr_block = "0.0.0.0/0"

  gateway_id = var.internet_gateway_id
}

resource "aws_route_table_association" "public" {

  for_each = var.public_subnet_ids

  subnet_id = each.value

  route_table_id = aws_route_table.public.id
}






resource "aws_route_table" "private" {

  for_each = var.private_subnet_ids

  vpc_id = var.vpc_id

  tags = merge(
    var.tags,
    {
      Name = var.private_route_table_name[each.key]
    }
  )
}

resource "aws_route" "private" {

  for_each = var.private_subnet_ids

  route_table_id = aws_route_table.private[each.key].id

  destination_cidr_block = "0.0.0.0/0"

  nat_gateway_id = var.nat_gateway_ids[each.key]
}

resource "aws_route_table_association" "private" {

  for_each = var.private_subnet_ids

  subnet_id = each.value

  route_table_id = aws_route_table.private[each.key].id
}
