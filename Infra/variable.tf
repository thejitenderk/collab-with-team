variable "rg_name" {
  type = map(object({
    rgname = string
    rgloc  = string
  }))
}

variable "vnet_name" {
    type = map(object({
        name          = string
        rgloc         = string
        rgname        = string
        address_space = list(string)
    }))
}

variable "subnet_name" {}

variable "pip" {}

variable "lvmms" {}

variable "server_name" {}

variable "sqldbs" {}

variable "nsg" {

}

variable "nicnsgass" {}
