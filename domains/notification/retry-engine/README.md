# retry-engine

**Domain:** Notification  
**Language:** Go  
**Framework:** Gin  
**Architecture Style:** REST API  

## Description
Handles retry logic for failed notifications.

## Endpoints

- `GET /health`
- `POST /api/retry`
- `GET /api/retry/status`

## Build & Run

```bash
go mod tidy
go run ./cmd/main.go
# Or with Docker:
docker build -t retry-engine .
docker run -p 4104:4104 retry-engine
