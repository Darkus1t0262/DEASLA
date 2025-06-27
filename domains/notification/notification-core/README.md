# notification-core

**Domain:** Notification  
**Language:** Go  
**Framework:** Gin  
**Architecture Style:** REST API  

## Description
Handles core notification logic.

## Endpoints

- `GET /health`
- `POST /api/notification/send`

## Build & Run

```bash
go mod tidy
go run ./cmd/main.go
# Or with Docker:
docker build -t notification-core .
docker run -p 4103:4103 notification-core
