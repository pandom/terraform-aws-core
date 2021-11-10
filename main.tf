terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.64.0"
    }
  }
}

provider "aws" {
  # Configuration options
  # Adds Default Tags
  default_tags {
    tags = {
        owner = "burkey@hashicorp.com"
        name = "burkey"
        ttl = "72"
    }
  }
  region = var.aws_region
}