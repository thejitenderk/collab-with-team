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
  address_space = ["10.0.0.0/16"]

}

module "subnet_m1" {
  depends_on       = [module.vnet_m]
  source           = "../module/subnet"
  subnetname       = "subnet_name_01"
  rgname           = "dev_resource_group_01"
  vnet             = "dev_virtual_network_01"
  address_prefixes = ["10.0.1.0/24"]

}

module "subnet_m2" {
  depends_on       = [module.vnet_m]
  source           = "../module/subnet"
  subnetname       = "subnet_name_02"
  rgname           = "dev_resource_group_01"
  vnet             = "dev_virtual_network_01"
  address_prefixes = ["10.0.2.0/24"]

}


module "pip_m1" {
  depends_on = [module.resource_group_m, module.vnet_m]
  source     = "../module/public-ip"
  publicip   = "frontend_public_ip"
  rgloc      = "Central India"
  rgname     = "dev_resource_group_01"
}

module "pip_m2" {
  depends_on = [module.resource_group_m, module.vnet_m]
  source     = "../module/public-ip"
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
  custom_data = base64encode(<<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y git curl

    # Install Node.js and npm
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
    apt-get install -y nodejs

    # Clone the repo
    git clone https://github.com/devopsinsiders/ReactTodoUIMonolith.git /home/azureuser/react-app

    cd /home/azureuser/react-app
    npm install
    npm run build
    npm install -g serve
    serve -s build -l 3000

  EOF
  )

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
  custom_data = base64encode(<<-EOF
    #!/bin/bash
    apt update -y
    apt install -y python3 python3-pip git

    cd /home/azureuser
    git clone https://github.com/devopsinsiders/PyTodoBackendMonolith.git
    cd PyTodoBackendMonolith

    pip3 install -r requirements.txt

    # Optional: Export Flask or Django environment variables
    export FLASK_APP=app.py
    export FLASK_ENV=production

    # Run Flask app on port 5000
    nohup flask run --host=0.0.0.0 --port=5000 &
  EOF
  )

}

module "sql_server_m" {
  depends_on = [module.resource_group_m]
  source     = "../module/sql-server"

  servername = "firstsqlserver"
  username   = "adminuser"
  password   = "Welcome@123"
  rgloc      = "Central India"
  rgname     = "dev_resource_group_01"

}

module "sql_database_m" {
  depends_on = [ module.resource_group_m, module.sql_server_m ]
  source = "../module/sql-database"
  rgname     = "dev_resource_group_01"
  sql_database = "myfirstdatabase"
  servername = "firstsqlserver"

}