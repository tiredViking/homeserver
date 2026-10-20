variable "zone_name" {
  type        = string
  description = "Name of the SDN zone for the Windows lab."
}

variable "node_names" {
  type        = list(string)
  description = "Proxmox nodes on which the lab SDN zone is applied."
}

variable "vnet_name" {
  type        = string
  description = "Name of the VNet that the lab VMs attach to."
}

variable "subnet_cidr" {
  type        = string
  description = "Subnet of the lab network in CIDR notation."
}