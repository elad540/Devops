terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "1.16.0"
    }
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.18.0"
    }
  }
}

resource "linode_instance" "ubuntu" {
  count = 0
  label = "kala-${count.index + 1}"
  image = "linode/ubuntu20.04lts" #change for newer version
  region = region
  type = "g6-nanode-1"
  swap_size = 1024
  authorized_keys = var.authorized_key
  root_pass = var.root_pass
  backups_enabled = false
  booted = true
  watchdog_enabled = true
  tags= [ "free" , "ubuntu20.4"]
}

# Add an A record to the domain for www.example.com.
resource "digitalocean_record" "www" {
  domain = "kala-crm.co.il"
  type   = "A"
  name   = linode_instance.ubuntu.*.label
  ttl    =  1800
  value  = linode_instance.ubuntu.*.ipv4
}

resource "digitalocean_record" "nop" {
  domain = "kala-crm.co.il"
  type   = "A"
  name   = "kala-" + linode_instance.ubuntu.*.label
  ttl    =  1800
  value  = linode_instance.ubuntu.*.ipv4
}

resource "null_resource" "after_linode_instance" {
  depends_on = [linode_instance.ubuntu]
  #Create Masters Inventory
  provisioner "local-exec" {
    command =  "echo  \"[linode_hosts]\" > ./ansible/hosts"
  }
  #add hosts to Ansible Inventory file
  provisioner "local-exec" {
    command = "terraform output -json hosts_names >> ./ansible/hosts"
  }
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


