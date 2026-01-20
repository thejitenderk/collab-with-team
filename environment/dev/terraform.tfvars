rg_name = {
  dev-todo-jk-rg = {
    location = "West US"
  }
}

vnet_name = {
  dev-todo-jk-vnet = {
    address_space = ["10.0.0.0/16"]
  }
}

subnet_name = {
  dev-todo-jk-fsubnet = {
    address_prefixes = ["10.0.1.0/24"]
  }
  dev-todo-jk-bsubnet = {
    address_prefixes = ["10.0.2.0/24"]
  }
}

# pip = {
#   pip1 = {
#     name   = "dev-todo-jk-pip"
#     rgloc  = "UK South"
#     rgname = "dev-todo-jk-rg"
#   }
#   pip2 = {
#     name   = "dev-todo-jk-pip2"
#     rgloc  = "UK South"
#     rgname = "dev-todo-jk-rg"
#   }

# }

lvmms = {
  devtodojkfvm = {
    subnetname = "dev-todo-jk-fsubnet"
    nicname    = "dev-todo-jk-fnic"
    username   = "adminuser"
    password   = "Welcome@123"
    customdata = <<-EOT
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
  devtodojkbvm = {
    subnetname = "dev-todo-jk-bsubnet"
    nicname    = "dev-todo-jk-bnic"
    username   = "adminuser"
    password   = "Welcome@123"
    customdata = <<-EOT
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


nsg = {
  devtodojknsg = {
    security_rule = [
      {
        name       = "httprule"
        priority   = 102
        dest_range = "80"
      },
      {
        name       = "sshrule"
        priority   = 100
        dest_range = "22"
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
