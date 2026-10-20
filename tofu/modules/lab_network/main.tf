resource "proxmox_sdn_zone_simple" "test" {
  id    = var.zone_name
  nodes = var.node_names
  mtu   = 1500
  ipam  = var.ipam

  depends_on = [
    proxmox_sdn_applier.finalizer,
  ]
}

resource "proxmox_sdn_vnet" "test_vnet" {
  id   = var.vnet_name
  zone = proxmox_sdn_zone_simple.test.id

  depends_on = [
    proxmox_sdn_applier.finalizer
  ]
}

resource "proxmox_sdn_subnet" "test_subnet" {
  cidr    = var.subnet_cidr
  vnet    = proxmox_sdn_vnet.test_vnet.id
  gateway = var.gateway

  depends_on = [
    proxmox_sdn_applier.finalizer
  ]
}

resource "proxmox_sdn_applier" "test_applier" {
  on_create  = true
  on_destroy = false
  depends_on = [
    proxmox_sdn_zone_simple.test,
    proxmox_sdn_vnet.test_vnet,
    proxmox_sdn_subnet.test_subnet,
  ]
  lifecycle {
    replace_triggered_by = [
      proxmox_sdn_zone_simple.test,
      proxmox_sdn_vnet.test_vnet,
      proxmox_sdn_subnet.test_subnet,
    ]
  }
}

resource "proxmox_sdn_applier" "finalizer" {
  on_destroy = true
  on_create  = false
}
