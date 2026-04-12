variable "server_name" {
  description = "Name of the PostgreSQL server"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "admin_username" {
  description = "PostgreSQL administrator username"
  type        = string
  default     = "psqladmin"
}

variable "admin_password" {
  description = "PostgreSQL administrator password"
  type        = string
  sensitive   = true
}

variable "database_name" {
  description = "Name of the database to create"
  type        = string
  default     = "fastapi"
}

variable "backup_retention_days" {
  description = "Backup retention period in days"
  type        = number
  default     = 7
}

variable "postgres_version" {
  description = "PostgreSQL version"
  type        = string
  default     = "18"
}

variable "sku_name" {
  description = "SKU name for the server"
  type        = string
  default     = "B_Standard_B1ms"
}

variable "storage_mb" {
  description = "Storage capacity in MB"
  type        = number
  default     = 32768
}

variable "storage_tier" {
  description = "Storage tier"
  type        = string
  default     = "P4"
}

variable "availability_zone" {
  description = "Availability zone"
  type        = number
  default     = 2
}
