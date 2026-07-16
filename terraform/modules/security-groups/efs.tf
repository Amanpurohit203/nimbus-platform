

resource "aws_security_group" "efs" {

  name        = var.efs_security_group_name
  description = "Security Group for Amazon EFS"

  vpc_id = var.vpc_id

  tags = merge(
    var.tags,
    {
      Name = var.efs_security_group_name
    }
  )
}

resource "aws_vpc_security_group_ingress_rule" "efs_from_eks_nodes" {

  security_group_id = aws_security_group.efs.id

  referenced_security_group_id = aws_security_group.eks_node.id

  ip_protocol = "tcp"

  from_port = 2049
  to_port   = 2049

  description = "Allow NFS access from EKS worker nodes"
}

resource "aws_vpc_security_group_egress_rule" "efs_all" {

  security_group_id = aws_security_group.efs.id

  ip_protocol = "-1"

  cidr_ipv4 = "0.0.0.0/0"

  description = "Allow all outbound traffic"
}