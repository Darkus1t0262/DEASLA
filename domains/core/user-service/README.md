# 🧩 User Service - Core Domain

The **User Service** is part of the `core` domain in the DEAS-LA system. It is responsible for managing user data including registration, updates, and internal user operations for administrators and alert responders.

## 📌 Overview
- **Domain**: Core
- **Language**: Node.js
- **Architecture Style**: REST API
- **Database**: PostgreSQL
- **Libraries**: Express.js, Sequelize, JWT, CORS, Bcrypt

## 🔍 What This Microservice Does
- Creates and manages user accounts
- Handles user data updates and deletions
- Provides user lookup and query endpoints
- Integrates with `auth-service` and `role-service` for user permissions

## ⚙️ How It Works
- Exposes RESTful routes (`/users`)
- Uses Sequelize ORM to interact with a PostgreSQL DB
- Validates input and performs CRUD operations
- JWT tokens are decoded to associate user permissions
- Logs are sent to Prometheus and AWS CloudWatch
- Secured by HTTPS, JWT, and CORS policies

## ✅ QA/PROD Compliance
| Feature                          | Implemented |
|----------------------------------|-------------|
| RESTful architecture             | ✅          |
| PostgreSQL integration           | ✅          |
| Dockerized container             | ✅          |
| CI/CD pipeline via GitHub        | ✅          |
| Unit and functional tests        | ✅          |
| JWT + CORS security              | ✅          |
| CloudWatch and Prometheus logs  | ✅          |

API available at http://localhost:3001/users

---
## 🔄 Dependencies
auth-service: for token validation

role-service: for access control

profile-service: for enriched profile info

--- 

## 🚀 How to Run
```bash
docker build -t core-user-service .
docker run -p 3001:3001 core-user-service
