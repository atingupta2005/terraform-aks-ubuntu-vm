# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "myrg" {
  count = var.vm_count
  name = "${var.business_unit}-${var.environment}-${var.resoure_group_name}-${count.index}"
  location = var.vm_region[count.index]
}