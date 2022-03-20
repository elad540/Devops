#output "linode_provision_domain_id" {
#  value = "${linode_domain.ubuntu.id}"
#}

output "ip_address" {
  description = "IP address of the linode instance"
  value = join("\n",linode_instance.ubuntu.*.ip_address)
}