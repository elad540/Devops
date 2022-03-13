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

resource "linode_instance" "example_instance" {
  count = 0
  label = "kala-${count.index + 1}"
  image = "linode/ubuntu14.04lts"
  region = region
  type = "g6-nanode-1"
  swap_size = 1024
  authorized_keys = authorized_key
  root_pass = root_pass
  backups_enabled = false
  booted = true
  tags: [ "free" ]
}

variable "authorized_key" {
    type = string
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



