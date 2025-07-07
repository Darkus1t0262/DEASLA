# channel-validator

**Domain:** External  
**Language:** Python  
**Framework:** FastAPI  
**API Style:** REST API  

## Description
Validates external channels (email, phone/SMS) for alert delivery.

## Endpoints

- `GET /` Health check
- `POST /api/channel-validator/` Validate channel

## Build & Run

```bash
docker build -t channel-validator .
docker run -p 4005:4005 channel-validator
