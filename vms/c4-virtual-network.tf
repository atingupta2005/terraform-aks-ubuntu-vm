# Create Virtual Network
resource "azurerm_virtual_network" "myvnet" {
  count = var.vm_count
  name                = "myvnet-1"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.myrg[count.index].location
  resource_group_name = azurerm_resource_group.myrg[count.index].name
}

# Create Subnet
resource "azurerm_subnet" "mysubnet" {
  count = var.vm_count
  name                 = "mysubnet-1"
  resource_group_name  = azurerm_resource_group.myrg[count.index].name
  virtual_network_name = azurerm_virtual_network.myvnet[count.index].name
  address_prefixes     = ["10.0.2.0/24"]
}

# Create Azure Public IP Address
resource "azurerm_public_ip" "mypublicip" {
  count = var.vm_count
  name                = "mypublicip-${count.index}"
  resource_group_name = azurerm_resource_group.myrg[count.index].name
  location            = azurerm_resource_group.myrg[count.index].location
  allocation_method   = "Dynamic"
  domain_name_label = "ubuntu-mplqgh-${count.index}"
  sku               = "Basic"
}

# Create Network Interface
resource "azurerm_network_interface" "myvmnic" {
  count =var.vm_count 
  name                = "vmnic-${count.index}"
  location            = azurerm_resource_group.myrg[count.index].location
  resource_group_name = azurerm_resource_group.myrg[count.index].name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.mysubnet[count.index].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = element(azurerm_public_ip.mypublicip[*].id, count.index)     
  }
}
