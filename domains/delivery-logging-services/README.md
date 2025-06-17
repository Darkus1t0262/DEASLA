# Delivery & Logging Domain

The **Delivery & Logging** domain is responsible for distributing emergency alerts to multiple communication channels (SMS, email, push notifications), logging all delivery activities, and retrying failed attempts.

This domain plays a critical role in ensuring that alerts are actually delivered to users through various methods and that all outcomes are traceable.

---

## 📦 Microservices in This Domain

| Service Name      | Description                                             | Language | Framework |
|-------------------|---------------------------------------------------------|----------|-----------|
| email-service     | Sends email notifications using SMTP or external APIs  | Python   | FastAPI   |
| sms-service       | Sends SMS messages through a gateway                    | Python   | FastAPI   |
| push-service      | Delivers push notifications to mobile/web clients      | Python   | FastAPI   |
| logging-service   | Stores delivery logs and message traces                | Python   | FastAPI   |
| retry-service     | Detects failed deliveries and attempts retries          | Python   | FastAPI   |

---

## 🔧 Technologies Used

- **Language**: Python
- **Framework**: FastAPI
- **Asynchronous Support**: Yes (via Uvicorn)
- **Dockerized**: Yes
- **Cache/Queue Support**: Redis (for retry queue and message state)
- **Observability**: Prometheus (planned)
- **Testing**: Pytest

---

## 📁 Example Folder Structure

sms-service/
├── main.py
├── Dockerfile
├── requirements.txt
├── test_sms.py
└── README.md


---

## 🧪 Running Locally

```bash
pip install -r requirements.txt
uvicorn main:app --reload --port 8000


docker build -t sms-service .
docker run -p 8000:8000 sms-service
