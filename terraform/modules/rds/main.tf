resource "aws_db_subnet_group" "this" {

  name = "${var.identifier}-subnet-group"

  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.identifier}-subnet-group"
  }
}

resource "aws_db_instance" "this" {

  identifier = var.identifier

  engine = "postgres"

  engine_version = var.engine_version

  instance_class = var.instance_class

  allocated_storage = var.allocated_storage

  db_name = var.db_name

  username = var.username

  password = var.password

  db_subnet_group_name = aws_db_subnet_group.this.name

  vpc_security_group_ids = var.security_group_ids

  publicly_accessible = false

  storage_encrypted = true

  backup_retention_period = 7

  skip_final_snapshot = true

  deletion_protection = false

  apply_immediately = true

  tags = {
    Name = var.identifier
  }

}