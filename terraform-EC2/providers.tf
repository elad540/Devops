terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region  = "eu-central-1",
  access_key = AWS_SECRET_ACCESS_KEY
  secret_key = AWS_ACCESS_KEY_ID
}