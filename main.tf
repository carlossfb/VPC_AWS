terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.4.0"
    }
  }
  #   Configuração para remote state em S3 Bucket
  #   backend "s3" {
  #     bucket = "mybucket"
  #     key    = "aws-vpc/terraform.tfstate"
  #     region = var.location
  #   }
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