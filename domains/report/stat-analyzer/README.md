# stat-analyzer

**Domain:** Report  
**Language:** Rust  
**Framework:** Actix-web  
**Architecture Style:** REST API  

## Description
Analyzes statistical data (mean, min, max, count) for system reporting.

## Endpoints

- `GET /health`
- `POST /api/analyze`

## Build & Run

```bash
cargo build
cargo run
# Or with Docker:
docker build -t stat-analyzer .
docker run -p 4205:4205 stat-analyzer
