# soap-consumer

**Domain:** External  
**Language:** Python  
**Framework:** FastAPI  
**API Style:** SOAP-like endpoint (REST for demo)  

## Description
Handles SOAP-based integration with external systems.

## Endpoints

- `GET /` Health check
- `POST /api/soap/` SOAP action

## Build & Run

```bash
docker build -t soap-consumer .
docker run -p 4002:4002 soap-consumer
