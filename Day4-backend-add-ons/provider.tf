terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.4.0"
    }
  }
  backend "s3" {
    bucket = "snoooooow"
    region = "ap-south-1"
    key = "terraform-learning.tfstate"
  }
}

provider "aws" {
  region = var.aws_region
}