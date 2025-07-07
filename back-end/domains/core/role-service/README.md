# Role Service

**Domain:** Core  
**Tech:** Node.js, Express, Neo4j, REST  
**Design Patterns:** Repository, Singleton

## Overview

This service manages user roles for DEAS-LA.  
It uses Neo4j as a graph DB and implements Repository and Singleton patterns.

## Endpoints

- `GET /api/roles` — List all roles
- `POST /api/roles` — Create role
- `GET /api/roles/:name` — Get role by name
- `PUT /api/roles/:name` — Update role description
- `DELETE /api/roles/:name` — Delete role

## How It Works

- **Singleton pattern:** Ensures only one Neo4j driver instance is used.
- **Repository pattern:** Encapsulates all DB logic in a dedicated repository.
- **Swagger docs:** See `swagger.yaml`.
- **Unit tests:** Run with `npm test` (Jest).

## CI/CD

Automated tests with GitHub Actions in .github/workflows/ci.yml

## Run Locally

```bash
npm install
cp .env.example .env # Edit Neo4j URI, user, password
npm start

# Docker

docker build -t role-service .
docker run --env-file .env -p 3006:3006 role-service