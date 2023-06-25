# Resource: Azure Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "mylinuxvm" {
  count = var.vm_count
  name                = "ubuntu-${count.index}"
  computer_name       = "ubuntu-${count.index}" # Hostname of the VM
  resource_group_name = azurerm_resource_group.myrg[count.index].name
  location            = azurerm_resource_group.myrg[count.index].location
  size                = var.vm_size
  admin_username      = var.admin_username
  disable_password_authentication = false
  network_interface_ids = [ element(azurerm_network_interface.myvmnic[*].id, count.index)]  
  
  admin_ssh_key {
    username = var.admin_username
    public_key = file("${path.module}/ssh-keys/terraform-azure.pub")
  }
  
  admin_password      = var.admin_password
  os_disk {
    name = "osdisk${count.index}"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
  custom_data = filebase64("${path.module}/app-scripts/app1-cloud-init.txt")
}


