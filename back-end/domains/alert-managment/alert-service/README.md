# Alert Service

**Domain:** Alert Management  
**Tech:** C#, .NET 8, Cassandra, REST  
**Design Patterns:** Repository, Singleton

## Overview

This service manages the creation, updating, retrieval, and deletion of emergency alerts for DEAS-LA.  
Implements Repository and Singleton patterns using ASP.NET Core’s built-in dependency injection and repository principles.

## Endpoints

- `GET /api/alerts` — List all alerts  
- `POST /api/alerts` — Create a new alert  
- `GET /api/alerts/{id}` — Get alert by UUID  
- `PUT /api/alerts/{id}` — Update alert by UUID  
- `DELETE /api/alerts/{id}` — Delete alert by UUID  

## How It Works

- **Singleton pattern:** ASP.NET Core services use DI, and scoped/singleton lifetimes.
- **Repository pattern:** `IAlertRepository` handles all access to Cassandra DB via `CassandraCSharpDriver`.
- **Swagger/OpenAPI:** Automatically generated at `/swagger/index.html` when running the app.
- **Unit tests:** Located in `AlertService.Tests`, runnable with `dotnet test`.

## CI/CD

Continuous Integration is handled with GitHub Actions in `.github/workflows/ci.yml`, running builds and tests automatically on push.

## Run Locally

```bash
# Restore dependencies and run locally
dotnet restore
dotnet build
dotnet run --project AlertService

# Docker build and run
docker build -t alert-service .

docker run -e CASSANDRA_HOST=your_cassandra_host \
           -e CASSANDRA_PORT=9042 \
           -e CASSANDRA_KEYSPACE=deasla_alerts \
           -e CASSANDRA_USERNAME=cassandra \
           -e CASSANDRA_PASSWORD=securecassandra123 \
           -p 8081:8081 alert-service
