
variable "prefix" {
    description = "(Optional) You can use a prefix to add to the list of resources"
    default = ""
}

variable "resource_group_name" {
    description = "(Required) Name of the resource group to deploy the virtual network components"
}

variable "location" {
    description = "(Required) Define the region where the resources will be created"
}

variable "subnets" {
    description = "(Required) Map of the subnets to create in the virtual network"
    type = "map"
}

variable "vnet" {
    description = "(Required) Map of the vnet to create"
    type = "map"
}


variable "dns_zone" {
    type = "map"
}
