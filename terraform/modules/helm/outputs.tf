output "release_name" {

  description = "Helm Release Name"

  value = helm_release.this.name

}

output "release_namespace" {

  description = "Namespace where Helm chart is installed"

  value = helm_release.this.namespace

}

output "release_status" {

  description = "Status of Helm Release"

  value = helm_release.this.status

}

output "release_version" {

  description = "Installed Helm Chart Version"

  value = helm_release.this.version

}