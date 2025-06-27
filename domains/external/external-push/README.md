# external-push

**Domain:** External  
**Language:** Python  
**Framework:** FastAPI  
**API Style:** REST API  

## Description
Handles push requests from outside systems (mobile, partners, etc.).

## Endpoints

- `GET /` Health check
- `POST /api/external-push/` Receive external push request

## Build & Run

```bash
docker build -t external-push .
docker run -p 4004:4004 external-push
