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
  region  = var.region
  access_key = var.AWS_SECRET_ACCESS_KEY
  secret_key = var.AWS_ACCESS_KEY_ID
}

variable "AWS_ACCESS_KEY_ID" {
  type = string
}

variable "AWS_SECRET_ACCESS_KEY" {
  type = string
}

variable "region" {
  type = string
}