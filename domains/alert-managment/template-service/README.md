# Template Service

**Domain:** Alert Management  
**Tech:** C#, ASP.NET Core, MongoDB, REST  
**Design Patterns:** Repository, Singleton

## Overview

This service manages templates for alert messages in DEAS-LA.  
It provides CRUD operations for reusable notification templates.

## Endpoints

- `GET /api/templates` — List all templates
- `POST /api/templates` — Create template
- `GET /api/templates/{id}` — Get template by ID
- `PUT /api/templates/{id}` — Update template
- `DELETE /api/templates/{id}` — Delete template

## How It Works

- **Singleton pattern:** ASP.NET Core services/components are singleton by default, providing a single instance throughout the application.
- **Repository pattern:** `TemplateRepository` abstracts all MongoDB logic and operations.
- **Swagger/OpenAPI:** See `openapi.yaml` or `/swagger-ui.html` when running.
- **Unit tests:** Run with `dotnet test`.

## CI/CD

Automated tests with GitHub Actions in `.github/workflows/ci.yml`

## Run Locally

### Local Setup

Make sure MongoDB is running locally or you have access to a remote instance. The MongoDB connection details can be configured in **`appsettings.json`**.

```json
{
  "ConnectionStrings": {
    "MongoConnection": "mongodb://admin:secret123@34.204.16.234:27017/deasla_logs"
  },
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft.AspNetCore": "Warning"
    }
  },
  "AllowedHosts": "*"
}

# Docker

# Build Docker image
docker build -t template-service .

# Run the service with MongoDB credentials
docker run -e MONGO_HOST=34.204.16.234 \
           -e MONGO_PORT=27017 \
           -e MONGO_USER=admin \
           -e MONGO_PASSWORD=secret123 \
           -e MONGO_DB=deasla_logs \
           -p 4005:4005 template-service