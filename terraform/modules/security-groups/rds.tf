resource "aws_security_group" "rds" {

  name        = var.rds_security_group_name
  description = "Security Group for PostgreSQL RDS"

  vpc_id = var.vpc_id

  tags = merge(
    var.tags,
    {
      Name = var.rds_security_group_name
    }
  )
}

resource "aws_vpc_security_group_ingress_rule" "rds_from_eks_nodes" {

  security_group_id = aws_security_group.rds.id

  referenced_security_group_id = aws_security_group.eks_node.id

  ip_protocol = "tcp"

  from_port = 5432
  to_port   = 5432

  description = "Allow PostgreSQL access from EKS worker nodes"
}

resource "aws_vpc_security_group_egress_rule" "rds_all" {

  security_group_id = aws_security_group.rds.id

  ip_protocol = "-1"

  cidr_ipv4 = "0.0.0.0/0"

  description = "Allow all outbound traffic"
}