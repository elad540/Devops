terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "1.16.0"
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
  authorized_keys = authorized_keys
  root_pass = root_pass
  backups_enabled = false
  booted = true
  watchdog_enabled = true
  tags= [ "free" , "ubuntu20.4"]
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