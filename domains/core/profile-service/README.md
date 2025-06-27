# Profile Service

**Domain:** Core  
**Tech:** Node.js, Express, MongoDB, REST  
**Design Patterns:** Repository, Singleton

## Overview

This service manages user profiles for DEAS-LA.  
Follows Repository and Singleton patterns for maintainability and scalability.

## Endpoints

- `GET /api/profiles` — List all profiles
- `POST /api/profiles` — Create profile
- `GET /api/profiles/:id` — Get profile by ID
- `PUT /api/profiles/:id` — Update profile
- `DELETE /api/profiles/:id` — Delete profile

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

docker build -t profile-service .
docker run --env-file .env -p 3003:3003 profile-service
