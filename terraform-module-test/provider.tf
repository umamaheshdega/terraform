terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
  }

  backend "s3" {
    bucket         = "devops-pratice-82s"
    key            = "vpc-devops-test" # you should have unique keys with in the bucket, same key should not be used in other repos or tf projects
    region         = "us-east-1"
    dynamodb_table = "devops-pratice-state-lock"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}