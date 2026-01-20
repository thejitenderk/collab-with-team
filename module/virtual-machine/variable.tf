variable "lvmm" {
  type = map(object({
    rgname     = string
    location   = string
    username   = string
    password   = string
    customdata = string

    nicname    = string
    subnetname = string
    vnetname   = string
  }))
}

