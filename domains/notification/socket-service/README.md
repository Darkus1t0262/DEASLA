# socket-service

**Domain:** Notification  
**Language:** Go  
**Framework:** Gin + gorilla/websocket  
**Architecture Style:** WebSocket API  

## Description
Handles real-time alert delivery over WebSocket.

## Endpoints

- `GET /health`
- `GET /ws` (WebSocket)

## Build & Run

```bash
go mod tidy
go run ./cmd/main.go
# Or with Docker:
docker build -t socket-service .
docker run -p 4105:4105 socket-service
