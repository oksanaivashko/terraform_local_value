terraform {
  required_version = "~> 1.3.0" # Terraform version 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.53.0" # AWS Provider version
    }
  }
}