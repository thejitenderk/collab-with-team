variable "rg_name" {
  type = map(object({
    location = string
  }))
}

variable "vnet_name" {
  type = map(object({
    location      = optional(string, "West US")
    rgname        = optional(string, "dev-todo-jk-rg")
    address_space = list(string)
  }))
}

variable "subnet_name" {
  type = map(object({
    rgname           = optional(string, "dev-todo-jk-rg")
    vnetname         = optional(string, "dev-todo-jk-vnet")
    address_prefixes = list(string)
  }))
}

# variable "pip" {}

variable "lvmms" {
  type = map(object({
    rgname     = optional(string, "dev-todo-jk-rg")
    vnetname   = optional(string, "dev-todo-jk-vnet")
    location   = optional(string, "West US")
    subnetname = string
    nicname    = string
    username   = string
    password   = string
    customdata = string
  }))
}

variable "nsg" {
  type = map(object({
    rgname   = optional(string, "dev-todo-jk-rg")
    location = optional(string, "West US")
    security_rule = list(object({
      name       = string
      priority   = number
      dest_range = string
    }))
  }))
}

variable "nicnsgass" {
  type = map(object({
    nicname = string
    rgname  = string
    nsg     = string
  }))
}
