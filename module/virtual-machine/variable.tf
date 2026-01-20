variable "lvmm" {
  type = map(object({
    rgname     = string
    location   = string
    vm_size    = string
    username   = string
    password   = string
    customdata = string

    nicname    = string
    subnetname = string
    vnetname   = string
  }))
}

