# Input Variables

# 1. Business Unit Name
variable "business_unit" {
  description = "Business Unit Name"
  type = string
  default = "att"
}

# 2. Environment Name
variable "environment" {
  description = "Environment Name"
  type = string
  default = "trng"
}

# 3. Resource Group Name
variable "resoure_group_name" {
  description = "Resource Group Name"
  type = string
  default = "rgubuntu"
}


# 5. Virtual Network Name
variable "virtual_network_name" {
  description = "Virtual Network Name"
  type = string 
  default = "myvnet"
}

variable "vm_size" {
  type = string
  default = "standard_b1s"
}

variable "admin_username" {
  type = string
  default = "tuser"
}

variable "admin_password" {
  type = string
  default = "Cloud@526871"
}

variable "vm_count" {
  type = number
  default = 2
}

variable "vm_region" {
  type = list(string)
  default = ["EastUS", "EastUS", "EastUS", "EastUS", "EastUS", "EastUS", "EastUS", "EastUS", "EastUS", "EastUS", "EastUS2", "EastUS2", "EastUS2", "EastUS2", "EastUS2", "EastUS2", "EastUS2", "EastUS2", "EastUS2", "NorthEurope", "NorthEurope", "NorthEurope", "NorthEurope", "NorthEurope", "NorthEurope", "NorthEurope", "NorthEurope", "CentralUS", "CentralUS", "CentralUS", "CentralUS", "CentralUS", "CentralUS", "CentralUS", "CentralUS", "CentralUS", "JapanEast", "JapanEast", "JapanEast", "JapanEast", "JapanEast", "JapanEast", "JapanEast", "JapanEast", "JapanEast", "CanadaCentral", "CanadaCentral", "CanadaCentral", "CanadaCentral", "CanadaCentral", "CanadaCentral", "CanadaCentral", "CanadaCentral", "CanadaCentral", "CanadaCentral"]
}