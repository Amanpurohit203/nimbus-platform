resource "aws_subnet" "public" {

  for_each = var.public_subnets

  vpc_id                  = var.vpc_id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.az
  map_public_ip_on_launch = true

  tags = merge(
    var.tags,
    {
      Name = each.key

      "kubernetes.io/role/elb" = "1"

      "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    }
  )
}


resource "aws_subnet" "private" {

  for_each = var.private_subnets

  vpc_id            = var.vpc_id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az


  map_public_ip_on_launch = false

  tags = merge(
    var.tags,
    {
      Name = "${var.name_prefix}-${each.key}"

      "kubernetes.io/role/elb" = 1

      "kubernetes.io/cluster/${var.cluster_name}" = "shared"


    }
  )
}