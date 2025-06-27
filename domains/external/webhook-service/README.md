# webhook-service

**Domain:** External  
**Language:** Python  
**Framework:** FastAPI  
**API Style:** WebHook (REST endpoint for external events)  

## Description
Listens for and processes external webhook events.

## Endpoints

- `GET /` Health check
- `POST /api/webhook/` Webhook receiver

## Build & Run

```bash
docker build -t webhook-service .
docker run -p 4003:4003 webhook-service
