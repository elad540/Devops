terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "1.16.0"
    }
  }
}
provider "digitalocean" {
  token = var.tokendig
}
provider "linode" {
  token = "token"
}


#module "setup" {
#  source = "./modules/setup"
#}

variable "tokendig" {
  type = string
}