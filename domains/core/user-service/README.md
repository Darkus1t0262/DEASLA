# User Service

**Domain:** Core  
**Tech:** Node.js, Express, PostgreSQL, REST  
**Design Patterns:** Repository, Singleton

## Overview

This service manages user entities for DEAS-LA.  
Follows Repository and Singleton patterns for maintainability and scalability.

## Endpoints

- `GET /api/users` — List all users
- `POST /api/users` — Create user
- `GET /api/users/:id` — Get user by ID
- `PUT /api/users/:id` — Update user
- `DELETE /api/users/:id` — Delete user

## How It Works

- **Singleton pattern:** Ensures only one DB connection instance is used.
- **Repository pattern:** Encapsulates all DB logic in a dedicated repository.
- **Swagger docs:** See `swagger.yaml`.
- **Unit tests:** Run with `npm test` (Jest).

## CI/CD

Automated tests with GitHub Actions in .github/workflows/ci.yml

## Run Locally

```bash
npm install
cp .env.example .env # Edit DB credentials
npm start

# Docker

docker build -t user-service .
docker run --env-file .env -p 3002:3002 user-service