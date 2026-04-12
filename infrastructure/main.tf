resource "azurerm_resource_group" "fastapi" {
  name     = var.resource_group_name
  location = var.location
}

# Retrieve secrets from Key Vault
module "secrets" {
  source = "../modules/keyvault_secrets"

  key_vault_id = var.key_vault_id
}

# PostgreSQL Database
module "database" {
  source = "../modules/fastapi_database"

  server_name         = var.database_server_name
  database_name       = var.database_name
  resource_group_name = azurerm_resource_group.fastapi.name
  location            = azurerm_resource_group.fastapi.location
  admin_username      = var.database_admin_username
  admin_password      = module.secrets.database_password
  postgres_version    = var.postgres_version
  sku_name            = var.database_sku_name
  storage_mb          = var.database_storage_mb
}

# FastAPI Application
module "app" {
  source = "../modules/fastapi_app"

  app_name                  = var.app_name
  service_plan_name         = var.service_plan_name
  resource_group_name       = azurerm_resource_group.fastapi.name
  location                  = azurerm_resource_group.fastapi.location
  sku_name                  = var.app_service_plan_sku
  docker_image_name         = var.docker_image_name
  docker_registry_username  = var.docker_registry_username
  docker_registry_password  = module.secrets.docker_password
  container_port            = var.container_port
  environment_variables = {
    "ACCESS_TOKEN_EXPIRE_MINUTES" = var.access_token_expire_minutes
    "DATABASE_DRIVER"             = "postgresql+asyncpg"
    "DATABASE_HOSTNAME"           = module.database.server_fqdn
    "DATABASE_NAME"               = var.database_name
    "DATABASE_PASSWORD"           = module.secrets.database_password
    "DATABASE_PORT"               = "5432"
    "DATABASE_USERNAME"           = var.database_admin_username
    "SECRET_KEY"                  = module.secrets.api_key
    "ALGORITHM"                   = var.jwt_algorithm
    "APP_NAME"                    = "ShopAPI"
    "DEBUG" = false
    "ADMIN_EMAIL" = "admin123@shop.com"
    "ADMIN_USERNAME" = "admin123"
    "ADMIN_PASSWORD" = "admin123"
  }
}

# ========== DATABASE MIGRATIONS (MANUAL PROCESS) ==========
# For automated database migrations via Alembic:
# Uncomment below and run in a separate deployment step or within the container:
#
# export $(cat /proc/1/environ | tr '\0' '\n' | xargs)
# alembic upgrade head
#
# Note: This should be automated in CI/CD pipeline for zero-downtime deployments

