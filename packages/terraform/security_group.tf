
# web

resource "aws_security_group" "web-sg" {
  name        = "${var.project-name}-${var.environment-name}-web-sg"
  description = "web front role security group"
  vpc_id      = aws_vpc.vpc.id
  tags = {
    Name    = "${var.project-name}-${var.environment-name}-web-sg"
    Project = var.project-name
    Env     = var.environment-name
  }
}

resource "aws_security_group_rule" "http-to-web" {
  security_group_id = aws_security_group.web-sg.id
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 80
  to_port           = 80
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "https-to-web" {
  security_group_id = aws_security_group.web-sg.id
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 443
  to_port           = 443
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "web-to-tcp3000" {
  security_group_id        = aws_security_group.web-sg.id
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = 3000
  to_port                  = 3000
  source_security_group_id = aws_security_group.api-sg.id
}


# api

resource "aws_security_group" "api-sg" {
  name        = "${var.project-name}-${var.environment-name}-api-sg"
  description = "api role security group"
  vpc_id      = aws_vpc.vpc.id
  tags = {
    Name    = "${var.project-name}-${var.environment-name}-api-sg"
    Project = var.project-name
    Env     = var.environment-name
  }
}

resource "aws_security_group_rule" "tcp3000-to-api" {
  security_group_id = aws_security_group.api-sg.id
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 3000
  to_port           = 3000
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "api-to-http" {
  security_group_id = aws_security_group.api-sg.id
  type              = "egress"
  protocol          = "tcp"
  from_port         = 80
  to_port           = 80
  prefix_list_ids   = [data.aws_prefix_list.s3-pl.id]
}

resource "aws_security_group_rule" "api-to-https" {
  security_group_id = aws_security_group.api-sg.id
  type              = "egress"
  protocol          = "tcp"
  from_port         = 443
  to_port           = 443
  prefix_list_ids   = [data.aws_prefix_list.s3-pl.id]
}

resource "aws_security_group_rule" "api-to-db" {
  security_group_id        = aws_security_group.api-sg.id
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = 3306
  to_port                  = 3306
  source_security_group_id = aws_security_group.db-sg.id
}


# db

resource "aws_security_group" "db-sg" {
  name        = "${var.project-name}-${var.environment-name}-db-sg"
  description = "db security group"
  vpc_id      = aws_vpc.vpc.id
  tags = {
    Name    = "${var.project-name}-${var.environment-name}-db-sg"
    Project = var.project-name
    Env     = var.environment-name
  }
}

resource "aws_security_group_rule" "tcp3306-to-db" {
  security_group_id        = aws_security_group.db-sg.id
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = 3306
  to_port                  = 3306
  source_security_group_id = aws_security_group.api-sg.id
}
