# Template Service

**Domain:** Alert Management  
**Tech:** Java, Spring Boot, PostgreSQL, REST  
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

- **Singleton pattern:** Spring Boot services/components are singleton by default.
- **Repository pattern:** TemplateRepository abstracts all DB logic.
- **Swagger/OpenAPI:** See `openapi.yaml` or `/swagger-ui.html` when running.
- **Unit tests:** Run with `mvn test`.

## CI/CD

Automated tests with GitHub Actions in .github/workflows/ci.yml

## Run Locally

```bash
# Set DB in application.properties, then:
mvn clean package
java -jar target/template-service-1.0.0.jar


# Docker

docker build -t template-service .
docker run -e SPRING_DATASOURCE_URL=jdbc:postgresql://dbhost:5432/deasla_template \
           -e SPRING_DATASOURCE_USERNAME=youruser \
           -e SPRING_DATASOURCE_PASSWORD=yourpassword \
           -p 8083:8083 template-service