variable "app_name" {
  description = "Name of the web app"
  type        = string
}

variable "service_plan_name" {
  description = "Name of the App Service Plan"
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

variable "sku_name" {
  description = "SKU name for the App Service Plan"
  type        = string
  default     = "B1"
}

variable "docker_image_name" {
  description = "Docker image name (e.g., username/image:tag)"
  type        = string
}

variable "docker_registry_url" {
  description = "Docker registry URL"
  type        = string
  default     = "https://index.docker.io"
}

variable "docker_registry_username" {
  description = "Docker registry username"
  type        = string
}

variable "docker_registry_password" {
  description = "Docker registry password"
  type        = string
  sensitive   = true
}

variable "container_port" {
  description = "Port exposed by the container"
  type        = number
  default     = 8000
}

variable "environment_variables" {
  description = "Environment variables for the application"
  type        = map(string)
  default     = {}
}
