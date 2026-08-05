variable "secret_name" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type      = string
  sensitive = true
}

variable "database_name" {
  type = string
}

variable "host" {
  type = string
}

variable "port" {
  type = number
}