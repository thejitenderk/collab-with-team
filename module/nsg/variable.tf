variable "nsg" {
  type = map(object({
    location = string
    rgname   = string
    security_rule = list(object({
      name       = string
      priority   = string
      dest_range = string
    }))
  }))
}

