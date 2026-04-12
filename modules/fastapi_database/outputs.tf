output "server_id" {
  description = "The PostgreSQL server resource ID"
  value       = azurerm_postgresql_flexible_server.main.id
}

output "server_fqdn" {
  description = "The fully qualified domain name of the PostgreSQL server"
  value       = azurerm_postgresql_flexible_server.main.fqdn
}

output "database_id" {
  description = "The database resource ID"
  value       = azurerm_postgresql_flexible_server_database.main.id
}
