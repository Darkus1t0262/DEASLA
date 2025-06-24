# 👤 Profile Service - Core Domain

The **Profile Service** manages extended user metadata in the DEAS-LA system. It links user identities to preferences, regional settings, device information, and other non-authentication-related data.

## 📌 Overview
- **Domain**: Core
- **Language**: Node.js
- **Architecture Style**: REST API
- **Database**: MongoDB
- **Libraries**: Express.js, Mongoose, JWT, dotenv

## 🔍 What This Microservice Does
- Stores user profile information such as:
  - Name, contact details, photo URL
  - Preferred language and region
  - Device and platform metadata
- Enables update and retrieval of user profiles
- Links to `user-service` for identity mapping
- Supports region-based filtering and segmentation

## ⚙️ How It Works
- RESTful endpoints exposed at `/profiles`
- Connects to MongoDB using Mongoose
- Uses middleware for JWT token validation
- Sends logs to Prometheus and AWS CloudWatch

## ✅ QA/PROD Compliance
| Feature                             | Implemented |
|-------------------------------------|-------------|
| RESTful architecture                | ✅          |
| MongoDB integration                 | ✅          |
| Dockerized container                | ✅          |
| CI/CD pipeline with GitHub Actions  | ✅          |
| JWT Middleware for auth             | ✅          |
| CORS + HTTPS enforced               | ✅          |
| Functional + unit testing           | ✅          |
| Logging and monitoring              | ✅          |

API base URL: http://localhost:3005/profiles

--- 

## 🔄 Dependencies
user-service: provides unique user IDs to link profiles

language-service: fetches preferred language

role-service: can enrich user context for dashboard displays

## 🚀 How to Run
```bash
docker build -t core-profile-service .
docker run -p 3005:3005 core-profile-service
