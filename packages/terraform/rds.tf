
resource "aws_db_parameter_group" "mysql-pg" {
  name   = "${var.project-name}-${var.environment-name}-mysql-pg"
  family = "mysql5.7"
  parameter {
    name  = "character_set_database"
    value = "utf8mb4"
  }
  parameter {
    name  = "character_set_server"
    value = "utf8mb4"
  }
}

resource "aws_db_option_group" "mysql-og" {
  name                 = "${var.project-name}-${var.environment-name}-mysql-og"
  engine_name          = "mysql"
  major_engine_version = "5.7"
}

resource "aws_db_subnet_group" "mysql-subnet-gp" {
  name = "${var.project-name}-${var.environment-name}-mysql-subnet-gp"
  subnet_ids = [
    aws_subnet.private-subnet-3.id,
    aws_subnet.private-subnet-4.id,
  ]
  tags = {
    Name    = "${var.project-name}-${var.environment-name}-mysql-subnet-gp"
    Project = var.project-name
    Env     = var.environment-name
  }
}

resource "random_string" "db-password" {
  length  = 16
  special = false
}

resource "aws_db_instance" "db-mysql" {
  identifier     = "${var.project-name}-${var.environment-name}-db-mysql"
  engine         = "mysql"
  engine_version = "5.7.33"
  port           = 3306
  username       = "root"
  password       = random_string.db-password.result

  instance_class        = "db.t2.micro"
  allocated_storage     = 10
  max_allocated_storage = 30
  storage_type          = "gp2"
  storage_encrypted     = false

  multi_az               = false
  availability_zone      = "us-west-2c"
  db_subnet_group_name   = aws_db_subnet_group.mysql-subnet-gp.name
  vpc_security_group_ids = [aws_security_group.db-sg.id]
  publicly_accessible    = false

  name                 = var.project-name
  parameter_group_name = aws_db_parameter_group.mysql-pg.name
  option_group_name    = aws_db_option_group.mysql-og.name

  backup_retention_period    = 7
  backup_window              = "04:00-05:00"
  maintenance_window         = "Mon:05:00-Mon:08:00"
  auto_minor_version_upgrade = false

  # NOTE: 以下は本番環境のときは修正する
  deletion_protection = false
  skip_final_snapshot = true

  apply_immediately = true

  tags = {
    Name    = "${var.project-name}-${var.environment-name}-db-mysql"
    Project = var.project-name
    Env     = var.environment-name
  }
}

