variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "rg-fastapi-lirook"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "centralindia"
}

variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
  default     = "bed9c8b2-bb60-492d-92a9-d1641fb7adf8"
}

variable "key_vault_id" {
  description = "The full resource ID of the Key Vault containing secrets"
  type        = string
  default     = "/subscriptions/bed9c8b2-bb60-492d-92a9-d1641fb7adf8/resourceGroups/remote-backend/providers/Microsoft.KeyVault/vaults/terraform-kv-lirook"
}

# Database Variables
variable "database_server_name" {
  description = "Name of the PostgreSQL server"
  type        = string
  default     = "lirook-fastapi"
}

variable "database_name" {
  description = "Name of the application database"
  type        = string
  default     = "fastapi"
}

variable "database_admin_username" {
  description = "PostgreSQL administrator username"
  type        = string
  default     = "psqladmin"
}

variable "postgres_version" {
  description = "PostgreSQL version"
  type        = string
  default     = "18"
}

variable "database_sku_name" {
  description = "SKU name for the PostgreSQL database"
  type        = string
  default     = "B_Standard_B1ms"
}

variable "database_storage_mb" {
  description = "Storage capacity for the database in MB"
  type        = number
  default     = 32768
}

# Application Variables
variable "app_name" {
  description = "Name of the FastAPI web application"
  type        = string
  default     = "fastapi-lirook"
}

variable "service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
  default     = "asp-fastapi-lirook"
}

variable "app_service_plan_sku" {
  description = "SKU name for the App Service Plan"
  type        = string
  default     = "B1"
}

variable "docker_image_name" {
  description = "Docker image name with tag (e.g., username/image:tag)"
  type        = string
  default     = "lirook6969/kodekloudproject-api:latest"
}

variable "docker_registry_username" {
  description = "Docker Hub username"
  type        = string
  default     = "lirook6969"
}

variable "container_port" {
  description = "Port exposed by the container"
  type        = number
  default     = 8000
}

# Application Settings
variable "access_token_expire_minutes" {
  description = "JWT access token expiration time in minutes"
  type        = string
  default     = "30"
}

variable "jwt_algorithm" {
  description = "JWT algorithm for token signing"
  type        = string
  default     = "HS256"
}
