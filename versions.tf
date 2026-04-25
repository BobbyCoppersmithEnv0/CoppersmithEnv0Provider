# Terraform version requirements
terraform {
  required_version = ">= 1.3.0"

  required_providers {
    env0 = {
      source  = "env0/env0"
      version = "~> 1.29"
    }
  }
}
