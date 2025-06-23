module "resource_group_m" {
  source = "../module/resource-group"
  rgname = "dev_resource_group_01"
  rgloc  = "Central India"
}

module "vnet_m" {

  depends_on    = [module.resource_group_m]
  source        = "../module/virtual-network"
  vnet          = "dev_virtual_network_01"
  rgloc         = "Central India"
  rgname        = "dev_resource_group_01"
  address_space = ["10.0.0.0./16"]

}

module "subnet_m1" {
  depends_on     = [module.vnet_m]
  source         = "../module/subnet"
  subnetname     = "subnet_name_01"
  rgname         = "dev_resource_group_01"
  vnet           = "dev_virtual_network_01"
  address_prefixes = ["10.0.1.0/24"]

}

module "subnet_m2" {
  depends_on     = [module.vnet_m]
  source         = "../module/subnet"
  subnetname     = "subnet_name_02"
  rgname         = "dev_resource_group_01"
  vnet           = "dev_virtual_network_01"
  address_prefixes = ["10.0.2.0/24"]

}


module "pip_m1" {
  depends_on = [module.resource_group_m]
  source     = "../module/publicip"
  publicip   = "frontend_public_ip"
  rgloc      = "Central India"
  rgname     = "dev_resource_group_01"
}

module "pip_m2" {
  depends_on = [module.resource_group_m]
  source     = "../module/publicip"
  publicip   = "backend_public_ip"
  rgloc      = "Central India"
  rgname     = "dev_resource_group_01"
}

module "virtualm_m1" {
  depends_on = [module.pip_m1, module.subnet_m1, module.resource_group_m, module.vnet_m]
  source     = "../module/virtual-machine"

  nicname        = "network_interface_01"
  rgloc          = "Central India"
  rgname         = "dev_resource_group_01"
  lvmm           = "frontendvm"
  admin_username = "adminuser"
  admin_password = "Welcome@1234"
  publicip       = "frontend_public_ip"
  subnetname     = "subnet_name_01"
  vnet           = "dev_virtual_network_01"

}

module "virtualm_m2" {
  depends_on = [module.pip_m2, module.subnet_m2, module.resource_group_m, module.vnet_m]
  source     = "../module/virtual-machine"

  nicname        = "network_interface_02"
  rgloc          = "Central India"
  rgname         = "dev_resource_group_01"
  lvmm           = "backendvm"
  admin_username = "adminuser"
  admin_password = "Welcome@1234"
  publicip       = "backend_public_ip"
  subnetname     = "subnet_name_02"
  vnet           = "dev_virtual_network_01"

}

