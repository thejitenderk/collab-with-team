module "rgs" {
  source = "../../module/resource-group"
  rgname = var.rg_name
}

module "vnets" {
  depends_on = [module.rgs]
  source     = "../../module/virtual-network"
  vnet       = var.vnet_name
}

module "subnets" {
  depends_on = [module.vnets]
  source     = "../../module/subnet"
  subnetname = var.subnet_name
}


# module "pips" {
#   depends_on = [module.rgs]
#   source     = "../../module/public-ip"
#   publicip   = var.pip
# }

module "vms" {
  depends_on = [ module.subnets, module.rgs]
  source     = "../../module/virtual-machine"
  lvmm       = var.lvmms
}


module "nsg" {
  depends_on = [module.rgs]
  source     = "../../module/nsg"
  nsg        = var.nsg
}

module "nicnsgass" {
  depends_on = [module.nsg, module.rgs, module.vms]
  source     = "../../module/nic-nsg-association"
  nicnsgass  = var.nicnsgass
}
