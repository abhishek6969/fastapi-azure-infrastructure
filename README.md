# FastAPI Azure Infrastructure - Quick Start Template

A ready-to-use Terraform template for spinning up a complete FastAPI development environment on Azure in minutes. This project automates the setup of a web application, database, and security infrastructure so you can focus on building your API instead of configuring cloud resources.

## What It Does

This template automatically creates:
- **A web server** in the cloud to run your FastAPI application
- **A PostgreSQL database** to store your data  
- **Security setup** to manage passwords and secrets safely
- **Docker integration** to containerize your FastAPI app

Perfect for dev/testing environments that need to be stood up quickly without manual Azure portal configuration.

## Important ⚠️

**This is a development environment template.** Before using in production:
- Remove hardcoded admin credentials
- Set up proper CI/CD pipelines instead of manual SSH commands
- Use managed identities for better security
- Configure automated database migrations

## Project Structure

```
FastAPI-Infrastructure/
├── infrastructure/           # Main configuration that uses modules
│   ├── main.tf              # Module calls and resource group
│   ├── var.tf               # Input variables for the main config
│   ├── outputs.tf           # Output values (app URL, database FQDN, etc.)
│   ├── versions.tf          # Terraform and provider versions
│   ├── backend.tf           # Remote state configuration
│   └── terraform.tfvars     # Variable values
│
└── modules/                 # Reusable Terraform modules
    ├── keyvault_secrets/    # Retrieves secrets from Azure Key Vault
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    │
    ├── fastapi_database/    # PostgreSQL database setup
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    │
    └── fastapi_app/         # Web app and service plan
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

## Modules

### `keyvault_secrets`
Retrieves sensitive secrets from Azure Key Vault.

**Inputs:**
- `key_vault_id` - Full resource ID of the Key Vault

**Outputs:**
- `api_key` - The API secret key
- `database_password` - Database password
- `docker_password` - Docker registry password

### `fastapi_database`
Creates and configures PostgreSQL flexible server.

**Key Inputs:**
- `server_name` - PostgreSQL server name
- `database_name` - Database name (default: `fastapi`)
- `admin_password` - Database admin password
- `postgres_version` - Version (default: `18`)

**Outputs:**
- `server_fqdn` - Database domain name
- `server_id` - Server resource ID

### `fastapi_app`
Creates App Service Plan and Linux Web App with Docker support.

**Key Inputs:**
- `app_name` - Web app name
- `docker_image_name` - Docker image with tag
- `docker_registry_username` - Docker Hub credentials
- `environment_variables` - App-specific environment variables (ACCESS_TOKEN_EXPIRE_MINUTES, JWT_ALGORITHM, etc.)

**Outputs:**
- `app_default_hostname` - App URL
- `app_id` - App resource ID

## Usage

### Deploy
```bash
cd infrastructure
terraform init
terraform plan
terraform apply
```

### Customize for Different Environments

Edit `infrastructure/terraform.tfvars` to change:
- **Database:** server name, storage size, SKU
- **App:** name, container image, plan SKU
- **Application Settings:** token expiration, JWT algorithm

Example for staging:
```hcl
database_server_name     = "lirook-fastapi-staging"
app_name                 = "fastapi-lirook-staging"
docker_image_name        = "lirook6969/kodekloudproject-api:staging"
database_storage_mb      = 65536  # Larger storage
app_service_plan_sku     = "B2"   # Larger plan
```

## Key Design Decisions

1. **Minimal Parameterization:** Only app-specific values are parameterized (names, credentials, environment variables)
2. **Core Logic Unchanged:** Database backups, firewall rules, authentication methods remain consistent
3. **Secrets Management:** All sensitive data retrieved from Key Vault via dedicated module
4. **Reusability:** Modules can be extended for multiple app deployments with different configurations
