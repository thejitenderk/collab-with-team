variable "servername" {
  type = map(object({
    rgname         = string
    location       = string
    admin_login    = string
    admin_password = string
  }))
}


