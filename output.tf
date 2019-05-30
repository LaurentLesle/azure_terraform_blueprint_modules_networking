output "subnet_ids" {
  depends_on = [module.azure_dns_internal]

  value = zipmap(azurerm_subnet.subnets.*.name, azurerm_subnet.subnets.*.id)
}

output "vnet" {
  depends_on = [module.azure_dns_internal]
  value = {
    "id"            = azurerm_virtual_network.vnet.id
    "address_space" = join(",", azurerm_virtual_network.vnet.address_space)
  }
}

