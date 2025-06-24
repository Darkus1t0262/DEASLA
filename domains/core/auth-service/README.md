# 🔐 Auth Service - Core Domain

The **Auth Service** is part of the `core` domain in the DEAS-LA distributed emergency alert system. It handles user authentication, token generation, and session management using secure, stateless mechanisms.

## 📌 Overview
- **Domain**: Core
- **Language**: Node.js
- **Architecture Style**: REST API
- **Database**: Redis, PostgreSQL
- **Libraries**: Express.js, JWT, Bcrypt, CORS, dotenv, Redis client

## 🔍 What This Microservice Does
- Authenticates users via email and password
- Issues and validates JWT tokens
- Manages session state with Redis
- Provides token renewal and logout endpoints
- Secures endpoints using CORS and HTTPS
- Works in coordination with `user-service` and `role-service`

## ⚙️ How It Works
- Receives login credentials on `/login`
- Uses Bcrypt to compare password hashes
- Generates a JWT token signed with a secret key
- Stores sessions in Redis for fast access
- Includes token validation middleware for protected routes
- Exports logs to Prometheus and AWS CloudWatch

## ✅ QA/PROD Compliance
| Feature                          | Implemented |
|----------------------------------|-------------|
| RESTful architecture             | ✅          |
| Redis + PostgreSQL integration   | ✅          |
| Dockerized container             | ✅          |
| CI/CD pipeline via GitHub        | ✅          |
| JWT token security               | ✅          |
| CORS policy enforcement          | ✅          |
| Functional + unit tests          | ✅          |
| Logs to Prometheus/CloudWatch    | ✅          |

--- 
## Main endpoint: 
POST http://localhost:3002/login

--- 

## 🔄 Dependencies
user-service: to retrieve and validate user records

role-service: to attach permission context to issued tokens

## 🚀 How to Run
```bash
docker build -t core-auth-service .
docker run -p 3002:3002 core-auth-service
