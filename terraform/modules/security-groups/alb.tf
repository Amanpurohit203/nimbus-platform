resource "aws_security_group" "alb" {
  name        = "nimbus-alb-sg"
  description = "Security Group for Application Load Balancer"
  vpc_id      = var.vpc_id

  tags = merge(
    var.tags,
    {
      Name = var.alb_security_group_name
    }
  )
}

resource "aws_vpc_security_group_ingress_rule" "alb_http" {

  security_group_id = aws_security_group.alb.id

  description = "Allow HTTP from Internet"

  ip_protocol = "tcp"

  from_port = 80
  to_port   = 80

  cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "alb_https" {

  security_group_id = aws_security_group.alb.id

  description = "Allow HTTPS from Internet"

  ip_protocol = "tcp"

  from_port = 443
  to_port   = 443

  cidr_ipv4 = "0.0.0.0/0"
}


resource "aws_vpc_security_group_egress_rule" "alb_all" {

  security_group_id = aws_security_group.alb.id

  description = "Allow all outbound traffic"

  ip_protocol = "-1"

  cidr_ipv4 = "0.0.0.0/0"
}