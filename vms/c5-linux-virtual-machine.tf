# Resource: Azure Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "mylinuxvm" {
  count = var.vm_count
  name                = "ubuntu-${count.index}"
  computer_name       = "ubuntu-${count.index}" # Hostname of the VM
  resource_group_name = azurerm_resource_group.myrg[count.index].name
  location            = azurerm_resource_group.myrg[count.index].location
  size                = "standard_bms"
  admin_username      = "tuser"
  network_interface_ids = [ element(azurerm_network_interface.myvmnic[*].id, count.index)]  
  admin_password      = "Cloud@526871"
  os_disk {
    name = "osdisk${count.index}"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}


