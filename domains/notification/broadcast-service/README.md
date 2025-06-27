# broadcast-service

**Domain:** Notification  
**Language:** Go  
**Framework:** Gin  
**Architecture Style:** REST API  

## Description
Handles mass broadcasting of alerts/messages.  
POST `/api/broadcast/send`

## Endpoints

- `GET /health`
- `POST /api/broadcast/send`

## Build & Run

```bash
go mod tidy
go run ./cmd/main.go
# Or with Docker:
docker build -t broadcast-service .
docker run -p 4101:4101 broadcast-service
