variable "vnet" {
  type = map(object({
    location      = string
    rgname        = string
    address_space = list(string)
  }))
}
