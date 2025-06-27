# email-service

**Domain:** Delivery & Logging  
**Service:** email-service  
**Language:** Python  
**Framework:** FastAPI  
**Architecture Style:** REST API  
**QA/PROD Checklist:** This service fulfills requirements for email delivery, API docs, Docker, and tests.

---

## 📝 Description

Handles email dispatch for the DEAS-LA platform. Provides endpoints for sending emails via a simulated gateway (easy to upgrade to SMTP or SendGrid).

---

## 📚 Endpoints

| Method | Path            | Description         |
|--------|----------------|---------------------|
| POST   | /api/email/send | Send an email       |

---

## 🚀 Running Locally

```bash
docker build -t email-service .
docker run -p 8084:8084 email-service
