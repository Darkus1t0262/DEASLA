# report-generator

**Domain:** Report  
**Language:** Rust  
**Framework:** Actix-web  
**Architecture Style:** REST API  

## Description
Generates PDF/CSV reports for analytics and traceability.

## Endpoints

- `GET /health`
- `POST /api/report`

## Build & Run

```bash
cargo build
cargo run
# Or with Docker:
docker build -t report-generator .
docker run -p 4204:4204 report-generator
