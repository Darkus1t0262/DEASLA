# Auth Service

**Domain:** Core  
**Tech:** Node.js, Express, PostgreSQL, JWT, REST  
**Design Patterns:** Repository, Singleton

## Overview

This service handles user authentication and JWT issuance for DEAS-LA.  
Implements best practices with the Repository and Singleton patterns.  
Secured with JWT and CORS, containerized with Docker, and includes CI/CD pipeline and Swagger docs.

## Endpoints

- `POST /api/auth/register` — Register a new user
- `POST /api/auth/login` — Login and receive JWT
- `GET /api/auth/me` — Get current user (JWT-protected)

## How It Works

- **Singleton pattern:** Ensures only one DB connection is used (`src/config/db.js`).
- **Repository pattern:** All user DB access through repository (`src/repositories/userRepository.js`).
- **JWT auth:** Issue and verify tokens for secure endpoints.
- **Swagger docs:** See `swagger.yaml`.
- **Unit tests:** Run with `npm test` using Jest.

## CI/CD

Automated tests via GitHub Actions in .github/workflows/ci.yml

## Security

- Passwords hashed with bcrypt

- JWT tokens for authentication

- CORS enabled

## Run Locally

```bash
npm install
cp .env.example .env # Edit values for your DB and JWT secret
npm start

## Docker

docker build -t auth-service .
docker run --env-file .env -p 3001:3001 auth-service