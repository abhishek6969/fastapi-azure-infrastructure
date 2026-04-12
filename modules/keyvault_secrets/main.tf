data "azurerm_key_vault_secret" "api_key" {
  name         = "SECRET-KEY"
  key_vault_id = var.key_vault_id
}

data "azurerm_key_vault_secret" "database_password" {
  name         = "DATABASE-PASSWORD"
  key_vault_id = var.key_vault_id
}

data "azurerm_key_vault_secret" "docker_password" {
  name         = "DOCKER-PASSWORD"
  key_vault_id = var.key_vault_id
}
