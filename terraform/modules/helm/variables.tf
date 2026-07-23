
variable "release_name" {
  type = string
}

variable "repository" {
  type = string
}

variable "chart" {
  type = string
}

variable "chart_version" {
  type = string
}

variable "namespace" {
  type = string
}

variable "create_namespace" {
  type    = bool
  default = false
}

variable "set_values" {

  type = list(object({
    name  = string
    value = string
  }))

  default = []
}