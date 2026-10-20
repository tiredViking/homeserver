output "vnet_name" {
  description = "Name of the VNet that VMs attach to. Available only after the SDN configuration has been applied."
  value       = proxmox_sdn_vnet.test_vnet.id

  depends_on = [
    proxmox_sdn_applier.test_applier,
  ]
}

output "subnet_cidr" {
  description = "CIDR of the lab subnet."
  value       = proxmox_sdn_subnet.test_subnet.cidr
}

output "gateway" {
  description = "Gateway address of the lab subnet."
  value       = proxmox_sdn_subnet.test_subnet.gateway
}