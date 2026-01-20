variable "nicnsgass" {
  type = map(object({
    nicname = string
    rgname  = string
    nsg     = string
  }))
}
