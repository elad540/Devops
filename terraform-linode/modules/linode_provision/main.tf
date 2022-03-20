
resource "linode_instance" "ubuntu" {
  count = 0
  label = "kala-${count.index + 1}"
  image = "linode/ubuntu14.04lts"
  region = region
  type = "g6-nanode-1"
  swap_size = 1024
  authorized_keys = authorized_keys
  root_pass = root_pass
  backups_enabled = false
  booted = true
  tags: [ "free" ]
}

resource "null_resource" "after_linode_instance" {
  depends_on = [linode_instance.ubuntu]
  #Create Masters Inventory
  provisioner "local-exec" {
    command =  "echo  \"[linode_hosts]\" > ./ansible/hosts"
  }
  #add public hosts to hosts file
  provisioner "local-exec" {
    command = "terraform output -json ip_address >> ./ansible/hosts"
  }
}