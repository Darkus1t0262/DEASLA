# Language Service

**Domain:** Core  
**Tech:** Node.js, Express, MongoDB, REST  
**Design Patterns:** Repository, Singleton

## Overview

This service manages supported languages for DEAS-LA (for localization, internationalization, etc).
Implements Repository and Singleton patterns for maintainability and testability.

## Endpoints

- `GET /api/languages` — List all languages
- `POST /api/languages` — Create language
- `GET /api/languages/:id` — Get language by ID
- `PUT /api/languages/:id` — Update language
- `DELETE /api/languages/:id` — Delete language

## How It Works

- **Singleton pattern:** Ensures only one MongoDB connection instance is used.
- **Repository pattern:** Encapsulates all DB logic in a dedicated repository.
- **Swagger docs:** See `swagger.yaml`.
- **Unit tests:** Run with `npm test` (Jest).

## CI/CD

Automated tests with GitHub Actions in .github/workflows/ci.yml

## Run Locally

```bash
npm install
cp .env.example .env # Edit Mongo URI as needed
npm start

# Docker

docker build -t language-service .
docker run --env-file .env -p 3005:3005 language-service