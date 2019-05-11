# Creates a virtual network with multiple subnets and a private DNS



Reference the module to a specific version (recommended):
```
module "networking" {
    source                  = "git://github.com/LaurentLesle/azure_terraform_blueprint_modules_networking.git?ref=v1.x"
  
    location                = "${var.location}"
    resource_group_name     = "${var.resource_group_names["networking"]}"
    prefix                  = "${var.prefix}"
    vnet                    = "${var.vnet}"
    subnets                 = "${var.subnets}"
    dns_zone                = "${var.dns_zone}"
}
```
# Parameters

## resource_group_name
(Required) Name of the resource group to deploy the virtual network components
```
variable "resource_group_name" {
    description = "(Required) Name of the resource group to deploy the virtual network components"
}
```

## location
(Required) Define the region where the resources will be created
```
variable "location" {
    description = "(Required) Define the region where the resources will be created"
}
```

## prefix
(Optional) You can use a prefix to add to the list of resources
```
variable "prefix" {
    description = "(Optional) You can use a prefix to add to the list of resources"
}
```
Example
```
locals {
    prefix = "${random_string.prefix.result}-"
}

resource "random_string" "prefix" {
    length  = 4
    upper   = false
    special = false
}
```
## vnet
(Required) Map of the vnet to create
```
vnet_map {
    name                    = "vnet-aks-hk"
    address_space           = "10.130.0.0/16"
}
```

## subnets
(Required) Map of the subnets to create in the virtual network.
key   = name of the subnet
value = CIDR of the subnet

Note it is recommended to define all subnets with their CIDR block at the creation time of the virtual network to provide better network stability and avoid terraform to destroy and recreate a subnet.
```
subnet_map {
    aks-cluster1            = "10.130.253.0/25"
    appgw-aks-cluster1      = "10.130.253.128/25"
    bastion1                = "10.130.254.0/24"
}
```
## dns_zone
(Required) Map of the private DNS zone linked to the virtual network

Note it is included at creation time as the private dns zone cannot be added when the vnet has resources attached to it.
```
dns_zone {
    name        = "aks.internal"
    zone_type   = "Private"
}
```

# Output
## subnet_ids
Returns a map of
```
subnet_ids {
    key   = subnet name
    value = subnet id
}
```

## vnet
Return a map of
```
vnet { 
    id             = vnet id
    address_space  = The address space that is used the virtual network (comma separated)
}
```