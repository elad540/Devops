
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

