  resource "random_pet" "rg-name" {
    prefix    = var.resource_group_name_prefix
  }

  resource "azurerm_resource_group" "rg" {
    name      = random_pet.rg-name.id
    location  = var.resource_group_location
  }
  resource   "azurerm_virtual_network"   "myterraformnetwork"   {
    name                = "myVnet"
    address_space       = ["10.0.0.0/16"]
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
  }

  resource "azurerm_subnet" "myterraformsubnet" {
    name                 = "mySubnet"
    resource_group_name  = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.myterraformnetwork.name
    address_prefixes     = ["10.0.1.0/24"]
  }

    resource "azurerm_public_ip" "myterraformpublicip" {
      name                = "myPublicIP"
      location            = azurerm_resource_group.rg.location
      resource_group_name = azurerm_resource_group.rg.name
      allocation_method   = "Dynamic"
  }

  # Create network interface
  resource "azurerm_network_interface" "myterraformnic" {
    name                = "myNIC"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    ip_configuration {
      name                          = "myNicConfiguration"
      subnet_id                     = azurerm_subnet.myterraformsubnet.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id          = azurerm_public_ip.myterraformpublicip.id
    }


    # Create virtual machine
    resource "azurerm_linux_virtual_machine" "myterraformvm" {
      name                  = "myVM"
      location              = azurerm_resource_group.rg.location
      resource_group_name   = azurerm_resource_group.rg.name
      network_interface_ids = [azurerm_network_interface.myterraformnic.id]
      size                  = "Standard_DS1_v2"

      os_disk {
        name                 = "myOsDisk"
        caching              = "ReadWrite"
        storage_account_type = "Premium_LRS"
      }

      source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
      }

      computer_name                   = "myvm"
      admin_username                  = "azureuser"
      disable_password_authentication = true
    }
}