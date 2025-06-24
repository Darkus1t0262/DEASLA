# 🛡️ Role Service - Core Domain

The **Role Service** is part of the `core` domain in the DEAS-LA emergency alert system. It manages user roles and permissions to enable secure access control across all domains.

## 📌 Overview
- **Domain**: Core
- **Language**: Node.js
- **Architecture Style**: REST API
- **Database**: MongoDB
- **Libraries**: Express.js, Mongoose, JWT, dotenv

## 🔍 What This Microservice Does
- Defines roles such as `admin`, `responder`, `analyst`, and `citizen`
- Provides APIs to assign roles to users
- Offers endpoints to retrieve, update, or revoke roles
- Validates and resolves roles during auth/token processes
- Works alongside `auth-service` to enforce access control policies

## ⚙️ How It Works
- Provides REST endpoints at `/roles`
- MongoDB stores role documents and user-role mappings
- Validates data with Mongoose schemas
- Returns role details to `auth-service` for inclusion in JWT payload
- Publishes access control changes via Kafka for event-driven sync

## ✅ QA/PROD Compliance
| Feature                           | Implemented |
|-----------------------------------|-------------|
| RESTful architecture              | ✅          |
| MongoDB integration               | ✅          |
| Dockerized container              | ✅          |
| CI/CD with GitHub Actions         | ✅          |
| Role-based access control (RBAC)  | ✅          |
| Kafka event publication           | ✅          |
| Unit and functional tests         | ✅          |
| Logging via Prometheus/CloudWatch | ✅          |

---

## Available endpoints:

GET /roles

POST /roles

PUT /roles/:id

DELETE /roles/:id

--- 

## 🔄 Dependencies
auth-service: requests role metadata to embed in JWT

user-service: applies role assignments to registered users

---

## 🚀 How to Run
```bash
docker build -t core-role-service .
docker run -p 3003:3003 core-role-service
