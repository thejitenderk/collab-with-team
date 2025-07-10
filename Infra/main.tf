module "rgs" {
  source = "../module/resource-group"
  rgname = var.rg_name

}

module "vnets" {
  depends_on = [module.rgs]
  source     = "../module/virtual-network"
  vnet       = var.vnet_name

}

module "subnets" {
  depends_on = [module.vnets]
  source     = "../module/subnet"
  subnetname = var.subnet_name
}


module "pips" {
  depends_on = [module.rgs, module.vnets]
  source     = "../module/public-ip"
  publicip   = var.pip
}

module "vms" {
  depends_on = [module.pips, module.subnets, module.rgs, module.vnets]
  source     = "../module/virtual-machine"
  lvmm       = var.lvmms

}


module "sql_servers" {
  depends_on = [module.rgs]
  source     = "../module/sql-server"
  servername = var.server_name

}

module "sqldbs" {
  depends_on   = [module.rgs, module.sql_servers]
  source       = "../module/sql-database"
  sql_database = var.sqldbs

}

module "nsg" {
  depends_on = [ module.rgs,module.nsg ]
  source = "../module/nsg"
  nsg = var.nsg
  
  
}
