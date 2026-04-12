output "api_key" {
  description = "The API secret key"
  value       = data.azurerm_key_vault_secret.api_key.value
  sensitive   = true
}

output "database_password" {
  description = "The database password"
  value       = data.azurerm_key_vault_secret.database_password.value
  sensitive   = true
}

output "docker_password" {
  description = "The Docker registry password"
  value       = data.azurerm_key_vault_secret.docker_password.value
  sensitive   = true
}
