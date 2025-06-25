# channel-service

**Domain:** Notification  
**Language:** Go  
**Framework:** Gin  
**Architecture Style:** REST API  

## Description
Routes messages to appropriate channels.

## Endpoints

- `GET /health`
- `POST /api/channel/route`

## Build & Run

```bash
go mod tidy
go run ./cmd/main.go
# Or with Docker:
docker build -t channel-service .
docker run -p 4102:4102 channel-service
