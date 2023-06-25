output "dns_name" {
  value = azurerm_public_ip.mypublicip[*].fqdn 
}
