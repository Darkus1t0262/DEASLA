# graphql-gateway

**Domain:** External  
**Language:** Python  
**Framework:** FastAPI  
**API Style:** GraphQL endpoint  

## Description
Aggregates data and exposes it via GraphQL for external consumers.

## Endpoints

- `GET /` Health check
- `POST /api/graphql/` GraphQL endpoint

## Build & Run

```bash
docker build -t graphql-gateway .
docker run -p 4001:4001 graphql-gateway
