# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "default" {
  count = length(var.aks_regions)
  name = "rg-aks-${count.index}"
  location = var.aks_regions[count.index]
}



resource "azurerm_kubernetes_cluster" "default" {
  count = length(var.aks_regions)
  name                = "aks-${count.index}"
  location            = azurerm_resource_group.default[count.index].location
  resource_group_name = azurerm_resource_group.default[count.index].name
  dns_prefix          = "aks-ympqlztb-${count.index}"
  
  sku_tier            = var.sku_tier
  kubernetes_version  = var.kubernetes_version

  network_profile {
    network_plugin    = var.network_plugin
    load_balancer_sku = var.load_balancer_sku
  }

  identity {
    type = var.identity_type
  }

  default_node_pool {
    name            = "default"
    node_count      = var.node_count
    vm_size         = var.vm_size
    os_disk_size_gb = 30
  }
}
