# 🌐 Language Service - Core Domain

The **Language Service** belongs to the `core` domain of the DEAS-LA system. It manages supported languages across the platform to ensure multilingual support for alert messages and UI components.

## 📌 Overview
- **Domain**: Core
- **Language**: Node.js
- **Architecture Style**: REST API
- **Database**: MySQL
- **Libraries**: Express.js, Sequelize, dotenv, Swagger

## 🔍 What This Microservice Does
- Stores available languages (e.g., Spanish, English, Portuguese)
- Provides language metadata and codes to all services
- Supports CRUD operations for language entries
- Enables localization for notifications and frontends

## ⚙️ How It Works
- Exposes endpoints at `/languages`
- Connects to MySQL via Sequelize
- Includes Swagger for API documentation
- Sends logs to Prometheus and AWS CloudWatch

## ✅ QA/PROD Compliance
| Feature                             | Implemented |
|-------------------------------------|-------------|
| RESTful architecture                | ✅          |
| MySQL integration                   | ✅          |
| Dockerized container                | ✅          |
| Swagger documentation               | ✅          |
| CI/CD pipeline via GitHub Actions   | ✅          |
| Logging with Prometheus/CloudWatch  | ✅          |
| Functional + unit test coverage     | ✅          |

API available at http://localhost:3004/languages

## 🔄 Dependencies
profile-service: links preferred language to user profile

notification-service: retrieves language for content translation

## 🚀 How to Run
```bash
docker build -t core-language-service .
docker run -p 3004:3004 core-language-service
