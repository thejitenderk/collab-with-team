rg_name = {
  rg1 = {
    rgname = "dev-todo-jk-rg"
    rgloc  = "UK South"
  }
}

vnet_name = {
  vnet1 = {
    name          = "dev-todo-jk-vnet"
    rgloc         = "UK South"
    rgname        = "dev-todo-jk-rg"
    address_space = ["10.0.0.0/16"]
  }
}

subnet_name = {
  subnet1 = {
    name             = "dev-todo-jk-subnet"
    rgloc            = "UK South"
    rgname           = "dev-todo-jk-rg"
    vnetname         = "dev-todo-jk-vnet"
    address_prefixes = ["10.0.1.0/24"]
  }
  subnet2 = {
    name             = "dev-todo-jk-subnet2"
    rgloc            = "UK South"
    rgname           = "dev-todo-jk-rg"
    vnetname         = "dev-todo-jk-vnet"
    address_prefixes = ["10.0.2.0/24"]
  }
}

pip = {
  pip1 = {
    name   = "dev-todo-jk-pip"
    rgloc  = "UK South"
    rgname = "dev-todo-jk-rg"
  }
  pip2 = {
    name   = "dev-todo-jk-pip2"
    rgloc  = "UK South"
    rgname = "dev-todo-jk-rg"
  }

}

lvmms = {
  vm1 = {
    name          = "devtodojkvm1"
    rgloc         = "UK South"
    rgname        = "dev-todo-jk-rg"
    subnetname    = "dev-todo-jk-subnet"
    vnetname      = "dev-todo-jk-vnet"
    use_public_ip = true
    pipname       = "dev-todo-jk-pip"
    nicname       = "dev-todo-jk-nic1"
    username      = "adminuser"
    password      = "Welcome@123"
    customdata    = <<-EOT
      #cloud-config
      package_update: true
      package_upgrade: true
      packages:
        - nginx
      runcmd:
        - systemctl start nginx
        - systemctl enable nginx
      EOT

  }
  vm2 = {
    name          = "devtodojkvm2"
    rgloc         = "UK South"
    rgname        = "dev-todo-jk-rg"
    subnetname    = "dev-todo-jk-subnet"
    use_public_ip = true
    pipname       = "dev-todo-jk-pip2"
    vnetname      = "dev-todo-jk-vnet"
    nicname       = "dev-todo-jk-nic2"
    username      = "adminuser"
    password      = "Welcome@123"
    customdata    = <<-EOT
      #cloud-config
      package_update: true
      package_upgrade: true
      packages:
        - nginx
      runcmd:
        - systemctl start nginx
        - systemctl enable nginx
      EOT

  }
}

/*
#server_name = {
#  server1 = {
#    name           = "devtodojksqlserver"
    rgloc          = "UK South"
    rgname         = "dev-todo-jk-rg"
    admin_login    = "adminuser"
    admin_password = "Welcome@123"
  }
}

sqldbs = {
  db1 = {
    name        = "devtodojksqldb"
    rgloc       = "UK South"
    rgname      = "dev-todo-jk-rg"
    server_name = "devtodojksqlserver"
  }
}
*/

nsg = {
  nsg1 = {
    rgname   = "dev-todo-jk-rg"
    location = "UK South"
    nsg      = "devtodojknsg"
    security_rule = [
      {
        name       = "httprule"
        priority   = 102
        dest_range = "80"
      }
    ]
  }
}





nicnsgass = {
  nicnsgass1 = {
    nicname = "dev-todo-jk-nic1"
    rgname  = "dev-todo-jk-rg"
    nsg     = "devtodojknsg"
  }
}
