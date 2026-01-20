variable "subnetname" {
  type = map(object({
    rgname           = string
    vnetname         = string
    address_prefixes = string
  }))
}
