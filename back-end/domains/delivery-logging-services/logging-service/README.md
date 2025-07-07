# logging-service

**Domain:** Delivery & Logging  
**Service:** logging-service  
**Language:** Python  
**Framework:** FastAPI  
**Architecture Style:** REST API  
**QA/PROD Checklist:** Fulfills delivery log storage, API docs, Docker, and tests.

---

## 📝 Description

Stores and queries delivery logs for the DEAS-LA platform. Easily extensible for integration with MongoDB, Elasticsearch, etc.

---

## 📚 Endpoints

| Method | Path    | Description     |
|--------|---------|-----------------|
| POST   | /api/logs/ | Store log entry |
| GET    | /api/logs/ | List all logs   |

---

## 🚀 Running Locally

```bash
docker build -t logging-service .
docker run -p 8086:8086 logging-service
