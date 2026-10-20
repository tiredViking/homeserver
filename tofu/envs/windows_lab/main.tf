module "lab_network" {
  source = "../../modules/lab_network"

  zone_name   = var.zone_name
  node_names  = var.node_names
  vnet_name   = var.vnet_name
  subnet_cidr = var.subnet_cidr
}