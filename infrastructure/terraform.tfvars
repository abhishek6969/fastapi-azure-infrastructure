# Resource Group Configuration
resource_group_name = "rg-fastapi-lirook"
location             = "centralindia"

# Database Configuration
database_server_name     = "lirook-fastapi"
database_name            = "fastapi"
database_admin_username  = "psqladmin"
database_sku_name        = "B_Standard_B1ms"
database_storage_mb      = 32768
postgres_version         = "18"

# Application Service Configuration
app_name             = "fastapi-lirook"
service_plan_name    = "asp-fastapi-lirook"
app_service_plan_sku = "B1"

# Docker Configuration
docker_image_name        = "lirook6969/fastapi-shop-prod:v3"
docker_registry_username = "lirook6969"
container_port           = 8000

# Application Settings
access_token_expire_minutes = "30"
jwt_algorithm               = "HS256"
