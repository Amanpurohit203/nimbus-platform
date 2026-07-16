resource "aws_security_group" "eks_control_plane" {

  name        = var.eks_control_plane_security_group_name
  description = "Security Group for EKS Control Plane"

  vpc_id = var.vpc_id

  tags = merge(
    var.tags,
    {
      Name = var.eks_control_plane_security_group_name
    }
  )
}

resource "aws_vpc_security_group_ingress_rule" "eks_control_plane_from_nodes" {

  security_group_id = aws_security_group.eks_control_plane.id

  referenced_security_group_id = aws_security_group.eks_node.id

  ip_protocol = "tcp"

  from_port = 443
  to_port   = 443

  description = "Allow Kubernetes API traffic from EKS worker nodes"
}

resource "aws_vpc_security_group_egress_rule" "eks_control_plane_all" {

  security_group_id = aws_security_group.eks_control_plane.id

  ip_protocol = "-1"

  cidr_ipv4 = "0.0.0.0/0"

  description = "Allow all outbound traffic"
}

