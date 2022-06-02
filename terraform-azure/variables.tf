variable "resource_group_name_prefix" {
  default       = "rg"
  description   = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "resource_group_location" {
  default       = "West Europe"
  description   = "Location of the resource group."
}

variable "vm_size" {
  default       = "D2ads_v5"
  description   = "The size of the vm."
}