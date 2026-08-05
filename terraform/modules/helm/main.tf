resource "helm_release" "this" {

  name       = var.release_name
  repository = var.repository
  chart      = var.chart
  version    = var.chart_version

  namespace        = var.namespace
  create_namespace = var.create_namespace

  set = [
    for s in var.set_values : {
      name  = s.name
      value = s.value
    }
  ]
  for s in var.set_values : {
    name  = s.name
    value = s.value
   }
 ]
}