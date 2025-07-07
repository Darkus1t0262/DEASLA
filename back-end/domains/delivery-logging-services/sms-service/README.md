# sms-service

**Domain:** Delivery & Logging  
**Service:** sms-service  
**Language:** Python  
**Framework:** FastAPI  
**Architecture Style:** REST API  
**QA/PROD Checklist:** This service fulfills requirements for message delivery, API docs, Docker, and tests.

---

## 📝 Description

Handles SMS message dispatch for the DEAS-LA platform. Provides endpoints for sending SMS via a simulated gateway (easy to upgrade to real integration).

---

## ⚙️ Technologies

- Python 3.11
- FastAPI
- Pydantic
- Docker

---

## 📚 Endpoints

| Method | Path          | Description         |
|--------|--------------|---------------------|
| POST   | /api/sms/send | Send an SMS message |


## 🚀 Running Locally
```bash

docker build -t sms-service .
docker run -p 8083:8083 sms-service

Example request:

```http
POST /api/sms/send
Content-Type: application/json

{
  "phone_number": "+593900000000",
  "message": "This is a test SMS"
}
