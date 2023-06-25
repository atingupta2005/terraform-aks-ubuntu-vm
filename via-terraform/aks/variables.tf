# Resource-1: Azure Resource Group
variable "aks_regions" {
  type = list(string)
  #default = ["EastUS", "WestUS", "UKSouth", "SouthCentralUS", "NorthEurope", "JapanEast", "EastUS2"]
}

variable "vm_size" {
  type = string
  default = "standard_b2s"
}

variable "node_count" {
  type = number
  default = 3
}

variable "kubernetes_version" {
  type = string
  default = "1.24.9"
}


variable "load_balancer_sku" {
  type = string
  default = "basic"
}


variable "sku_tier" {
  type = string
  default = "Free"
}


variable "network_plugin" {
  description = "Network plugin to use for networking."
  type        = string
  default     = "azure"
}

variable "identity_type" {
  description = "The type of identity used for the managed cluster."
  type        = string
  default     = "SystemAssigned"
}