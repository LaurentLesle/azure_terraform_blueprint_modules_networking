# Internal DNS used to host the applications published through the ingress controller
module "azure_dns_internal" {
    source                              = "git://github.com/LaurentLesle/azure_terraform_blueprint_modules_azure_dns.git?ref=v1.0"
    
    resource_group_name                 = "${var.resource_group_name}"
    dns_zone                            = "${var.dns_zone}"
    subdomain                           = "${var.location}."
    resolution_virtual_network_ids      = ["${azurerm_virtual_network.vnet.id}"]
}