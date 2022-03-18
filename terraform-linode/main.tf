terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "1.16.0"
    }
  }
}

provider "linode" {
  token = "token"
}

module "linode_provision" {
  source = "./modules/linode_provision"
  token = var.token
  authorized_key = var.authorized_key
  region = var.region
  root_pass = var.root_pass
}

module "setup" {
  source = "./modules/setup"
  host = module.linode_provision.linode_provision_ip_address
}


variable "token" {
  type = string
}

variable "root_pass" {
  type = string
}

variable "region" {
  type = string
}
variable "authorized_key" {
  type = string
}

