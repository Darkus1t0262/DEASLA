# feedback-service

**Domain:** Report  
**Language:** Rust  
**Framework:** Actix-web  
**Architecture Style:** REST API  

## Description
Collects user feedback for analysis and improvement.

## Endpoints

- `GET /health`
- `POST /api/feedback`
- `GET /api/feedbacks`

## Build & Run

```bash
cargo build
cargo run
# Or with Docker:
docker build -t feedback-service .
docker run -p 4202:4202 feedback-service
