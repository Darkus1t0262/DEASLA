# metrics-collector

**Domain:** Report  
**Language:** Rust  
**Framework:** Actix-web  
**Architecture Style:** REST API  

## Description
Gathers and exposes Prometheus-based or custom metrics.

## Endpoints

- `GET /health`
- `POST /api/metrics`
- `GET /api/metrics`

## Build & Run

```bash
cargo build
cargo run
# Or with Docker:
docker build -t metrics-collector .
docker run -p 4203:4203 metrics-collector
