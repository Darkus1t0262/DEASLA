# Schedule Service

**Domain:** Alert Management  
**Tech:** Java, Spring Boot, PostgreSQL, REST  
**Design Patterns:** Repository, Singleton

## Overview

This service manages the scheduling of alerts in DEAS-LA.
It provides CRUD operations for scheduled alert dispatches.

## Endpoints

- `GET /api/schedules` — List all schedules
- `POST /api/schedules` — Create schedule
- `GET /api/schedules/{id}` — Get schedule by ID
- `PUT /api/schedules/{id}` — Update schedule
- `DELETE /api/schedules/{id}` — Delete schedule

## How It Works

- **Singleton pattern:** Spring Boot services/components are singleton by default.
- **Repository pattern:** ScheduleRepository abstracts all DB logic.
- **Swagger/OpenAPI:** See `openapi.yaml` or `/swagger-ui.html` when running.
- **Unit tests:** Run with `mvn test`.

## CI/CD

Automated tests with GitHub Actions in .github/workflows/ci.yml

## Run Locally

```bash
# Set DB in application.properties, then:
mvn clean package
java -jar target/schedule-service-1.0.0.jar

# Docker

docker build -t schedule-service .
docker run -e SPRING_DATASOURCE_URL=jdbc:postgresql://dbhost:5432/deasla_schedule \
           -e SPRING_DATASOURCE_USERNAME=youruser \
           -e SPRING_DATASOURCE_PASSWORD=yourpassword \
           -p 8082:8082 schedule-service