# Validation Service

**Domain:** Alert Management  
**Tech:** C#, .NET Core, PostgreSQL, REST  
**Design Patterns:** Repository, Singleton

## Overview

This service validates alerts before dispatch in DEAS-LA.
It can log the validation result for later audit or monitoring.

## Endpoints

- `POST /api/validations` — Validate alert (returns validation result)
- `GET /api/validations` — List all results
- `GET /api/validations/{id}` — Get result by ID
- `DELETE /api/validations/{id}` — Delete result

## How It Works

- **Singleton pattern:** .NET Core services/components are singleton by default.
- **Repository pattern:** `ValidationResultRepository` abstracts all DB logic.
- **Swagger/OpenAPI:** See `openapi.yaml` or `/swagger-ui.html` when running.
- **Unit tests:** Run with `dotnet test`.

## CI/CD

Automated tests with GitHub Actions in `.github/workflows/ci.yml`

## Run Locally

```bash
# Set DB in appsettings.json, then:
dotnet build
dotnet run

# Docker

docker build -t validation-service .
docker run -e "ASPNETCORE_ENVIRONMENT=Development" \
           -e "ConnectionStrings__DefaultConnection=Host=localhost;Port=5432;Database=deaslapg;Username=admin;Password=securepasspg" \
           -p 5000:5000 validation-service


#Docker

docker build -t validation-service .
docker run -e SPRING_DATASOURCE_URL=jdbc:postgresql://dbhost:5432/deasla_validation \
           -e SPRING_DATASOURCE_USERNAME=youruser \
           -e SPRING_DATASOURCE_PASSWORD=yourpassword \
           -p 8085:8085 validation-service