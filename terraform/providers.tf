terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0"
    }
  }

  required_version = ">= 1.5.0"
}

provider "aws" {
  region = var.aws_region
  # Credentials are expected from environment, shared credentials file (~/.aws/credentials),
  # or CI/CD credential injection (e.g. via Jenkins).
}

# Kubernetes and Helm providers will be configured dynamically (after EKS cluster created)
# using the outputs of the eks module in main.tf through provider aliases.

