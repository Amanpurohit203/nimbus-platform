resource "aws_secretsmanager_secret" "this" {

  name = var.secret_name

}

resource "aws_secretsmanager_secret_version" "this" {

  secret_id = aws_secretsmanager_secret.this.id

  secret_string = jsonencode({

    username      = var.username
    password      = var.password
    database_name = var.database_name
    host          = var.host
    port          = var.port



    DATABASE_URL = "postgresql://${var.username}:${var.password}@${var.host}:${var.port}/${var.database_name}"

  })

}