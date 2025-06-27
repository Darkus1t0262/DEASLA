# Alert Service

**Domain:** Alert Management  
**Tech:** Java, Spring Boot, PostgreSQL, REST  
**Design Patterns:** Repository, Singleton

## Overview

This service manages the creation, updating, retrieval, and deletion of emergency alerts for DEAS-LA.  
Implements Repository and Singleton patterns using Spring Boot's best practices.

## Endpoints

- `GET /api/alerts` — List all alerts
- `POST /api/alerts` — Create alert
- `GET /api/alerts/{id}` — Get alert by ID
- `PUT /api/alerts/{id}` — Update alert
- `DELETE /api/alerts/{id}` — Delete alert

## How It Works

- **Singleton pattern:** Spring Boot services/components are singleton by default.
- **Repository pattern:** AlertRepository abstracts all DB logic.
- **Swagger/OpenAPI:** See `openapi.yaml` or `/swagger-ui.html` when running.
- **Unit tests:** Run with `mvn test`.

## CI/CD

Automated tests with GitHub Actions in .github/workflows/ci.yml


## Run Locally

```bash
# Set DB in application.properties, then:
mvn clean package
java -jar target/alert-service-1.0.0.jar

# Docker

docker build -t alert-service .
docker run -e SPRING_DATASOURCE_URL=jdbc:postgresql://dbhost:5432/deasla_alert \
           -e SPRING_DATASOURCE_USERNAME=youruser \
           -e SPRING_DATASOURCE_PASSWORD=yourpassword \
           -p 8081:8081 alert-service