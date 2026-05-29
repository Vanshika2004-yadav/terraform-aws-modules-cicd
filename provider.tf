terraform {
  required_version = ">= 1.6.0"

  backend "s3" {
    bucket = "vanshika-terraform-state-bucket-2026"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}