# retry-service

**Domain:** Delivery & Logging  
**Service:** retry-service  
**Language:** Python  
**Framework:** FastAPI  
**Architecture Style:** REST API  
**QA/PROD Checklist:** Handles message retry logic, API docs, Docker, and tests.

---

## 📝 Description

Handles retry logic for failed message deliveries. Can be extended to integrate with queues like RabbitMQ, AWS SQS, etc.

---

## 📚 Endpoints

| Method | Path    | Description         |
|--------|---------|---------------------|
| POST   | /api/retry/ | Retry a message   |
| GET    | /api/retry/ | List retry status |

---

## 🚀 Running Locally

```bash
docker build -t retry-service .
docker run -p 8087:8087 retry-service
