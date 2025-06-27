# audit-trail

**Domain:** Report  
**Language:** Rust  
**Framework:** Actix-web  
**Architecture Style:** REST API  

## Description
Captures all critical actions for audit and traceability.

## Endpoints

- `GET /health`
- `POST /api/audit/log`
- `GET /api/audit/logs`

## Build & Run

```bash
cargo build
cargo run
# Or with Docker:
docker build -t audit-trail .
docker run -p 4201:4201 audit-trail
