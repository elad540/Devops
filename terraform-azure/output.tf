output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "tls_private_key" {
  value     = tls_private_key.example_ssh.private_key_pem
  sensitive = true
}

output "public_ip" {
  description = "Public IP address of the Azure instance"
  value = join("\n",azurerm_linux_virtual_machine.myterraformvm.*.public_ip_address)
}

output "hosts_name" {
  description = "hosts name of the Azure instance"
  value = join("\n",  azurerm_linux_virtual_machine.myterraformvm.*.name)
}
