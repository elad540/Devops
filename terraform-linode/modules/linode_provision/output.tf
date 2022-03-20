#output "linode_provision_domain_id" {
#  value = "${linode_domain.ubuntu.id}"
#}

output "hosts_names" {
  description = "names of the linode instance created"
  value = join("\n",linode_instance.ubuntu.*.label)
}