variable "sql_database" {
  type = map(object({
    server_name = string
    rgname      = string
  }))
}
