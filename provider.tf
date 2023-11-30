terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.4.0"
    }
  }
}

provider "aws" {
  region = var.location
  default_tags {
    tags = {
      owner      = "carlossfb"
      managed-by = "terraform"
    }
  }
}