resource "null_resource" "setup" {
    provisioner "remote-exec" {
        connection {
            type = "ssh"
            user = "root"
            host = var.host
            private_key = chomp(file(var.root_ssh_privkey))
        }

        inline = [
            # install Python dependency for Ansible
            "which python || apt-get -y install python3",

            # non-root user account
            "id -u ${var.username} || useradd -m -s /bin/bash ${var.username}",
            "groups ${var.username} | grep -q sudo || usermod -a -G sudo ${var.username}",
            "[ -f /etc/sudoers.d/${var.username} ] || echo '${var.username} ALL = NOPASSWD : ALL' > /etc/sudoers.d/${var.username}",
            "[ -d /home/${var.username}/.ssh ] || mkdir /home/${var.username}/.ssh",
            "[ -f /home/${var.username}/.ssh/authorized_keys ] || echo '${chomp(file(var.user_ssh_pubkey))}' > /home/${var.username}/.ssh/authorized_keys",
            "chown -R ${var.username}:${var.username} /home/${var.username}/.ssh",
            "chmod 700 /home/${var.username}/.ssh",
            "chmod 600 /home/${var.username}/.ssh/authorized_keys"
        ]
    }
}

resource "null_resource" "ansible" {
    depends_on = ["null_resource.setup"]
    provisioner "local-exec" {
        command = "ansible-playbook -i ./ansible-inventory ../ansible/site.yaml"
    }
}
