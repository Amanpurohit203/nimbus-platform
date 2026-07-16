resource "aws_security_group" "eks_node" {
  name        = var.eks_node_security_group_name
  description = "Security Group for EKS Worker Nodes"
  vpc_id      = var.vpc_id

  tags = merge(
    var.tags,
    {
      Name = var.eks_node_security_group_name
    }
  )
}

resource "aws_vpc_security_group_ingress_rule" "eks_node_from_alb" {

  security_group_id = aws_security_group.eks_node.id

  referenced_security_group_id = aws_security_group.alb.id

  ip_protocol = "tcp"

  from_port = 80
  to_port   = 80

  description = "Allow application traffic from ALB"
}

resource "aws_vpc_security_group_egress_rule" "eks_node_all" {

  security_group_id = aws_security_group.eks_node.id

  ip_protocol = "-1"

  cidr_ipv4 = "0.0.0.0/0"

  description = "Allow all outbound traffic"
}