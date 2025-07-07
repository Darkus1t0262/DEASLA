# push-service

**Domain:** Delivery & Logging  
**Service:** push-service  
**Language:** Python  
**Framework:** FastAPI  
**Architecture Style:** REST API  
**QA/PROD Checklist:** Fulfills push notification delivery, API docs, Docker, and tests.

---

## 📝 Description

Handles push notification dispatch for the DEAS-LA platform. Easily extensible to use Firebase, OneSignal, or other push providers.

---

## 📚 Endpoints

| Method | Path          | Description                |
|--------|--------------|----------------------------|
| POST   | /api/push/send | Send a push notification   |

---

## 🚀 Running Locally

```bash
docker build -t push-service .
docker run -p 8085:8085 push-service
