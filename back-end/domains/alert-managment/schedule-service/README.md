# Schedule Service

**Domain:** Alert Management  
**Tech:** C#, ASP.NET Core, PostgreSQL, REST  
**Design Patterns:** Repository, Singleton

## Overview

This service manages schedules for alert messages in DEAS-LA.  
It provides CRUD operations for scheduling alert templates.

## Endpoints

- `GET /api/schedule` — List all scheduled alerts
- `POST /api/schedule` — Create a new schedule
- `GET /api/schedule/{id}` — Get schedule by ID
- `PUT /api/schedule/{id}` — Update schedule
- `DELETE /api/schedule/{id}` — Delete schedule

## How It Works

- **Singleton pattern:** ASP.NET Core services/components are singleton by default, providing a single instance throughout the application.
- **Repository pattern:** `ScheduleDbContext` and `IScheduleService` abstract all PostgreSQL and service logic respectively.
- **Entity Framework Core:** Uses PostgreSQL with **DbContext** for database interaction.
- **Swagger/OpenAPI:** See `openapi.yaml` or `/swagger-ui.html` when running.
- **Unit tests:** Run with `dotnet test`.

## CI/CD

Automated tests with GitHub Actions in `.github/workflows/ci.yml`

## Run Locally

### Local Setup

Make sure PostgreSQL is running locally or you have access to a remote instance. The connection string can be configured in **`appsettings.json`**.

```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Host=localhost;Port=5432;Database=deasla_schedule;Username=admin;Password=secret123"
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
docker build -t schedule-service .

# Run the service with PostgreSQL credentials
docker run -e ASPNETCORE_ENVIRONMENT=Development \
           -e DefaultConnection="Host=localhost;Port=5432;Database=deasla_schedule;Username=admin;Password=secret123" \
           -p 4005:4005 schedule-service
