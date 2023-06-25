# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "myrg" {
  count = var.vm_count
  name = "rg-${var.business_unit}-${var.environment}-${count.index}"
  location = var.vm_region[count.index]
  #location = "EastUS"
}