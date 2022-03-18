resource "linode_instance" "instance" {
    count = 0
    label = "kala-${count.index + 1}"
    image = "linode/ubuntu14.04lts"
    region = region
    type = "g6-nanode-1"
    swap_size = 1024
    authorized_keys = ["${chomp(file(var.root_ssh_pubkey))}"]
    root_pass = root_pass
    backups_enabled = false
    booted = true
    tags: [ "free" ]
}