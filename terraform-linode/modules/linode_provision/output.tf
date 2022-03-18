#output "linode_provision_domain_id" {
#  value = "${linode_domain.ubuntu.id}"
#}

output "linode_provision_ip_address" {
  value = "${linode_instance.ubuntu.ip_address}"
}
