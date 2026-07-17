# environments/dev/backend.tf

terraform {
  backend "s3" {
    bucket       = "nimbus-tf-state-amanpurohit-2026"
    key          = "dev/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
    encrypt      = true
  }
}