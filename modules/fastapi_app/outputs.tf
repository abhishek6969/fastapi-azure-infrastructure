output "app_id" {
  description = "The web app resource ID"
  value       = azurerm_linux_web_app.main.id
}

output "app_default_hostname" {
  description = "The default hostname of the web app"
  value       = azurerm_linux_web_app.main.default_hostname
}

output "service_plan_id" {
  description = "The App Service Plan resource ID"
  value       = azurerm_service_plan.main.id
}
