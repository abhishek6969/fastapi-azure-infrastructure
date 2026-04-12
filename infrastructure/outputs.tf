output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.fastapi.name
}

output "app_url" {
  description = "The default URL of the FastAPI application"
  value       = "https://${module.app.app_default_hostname}"
}

output "database_fqdn" {
  description = "The fully qualified domain name of the PostgreSQL database"
  value       = module.database.server_fqdn
}

output "database_name" {
  description = "The name of the created database"
  value       = var.database_name
}
