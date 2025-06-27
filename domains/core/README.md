# Core Domain

The **Core Domain** of the DEAS-LA project includes essential foundational services such as identity, authentication, user roles, profile management, and language preferences.

## 🔧 Microservices in This Domain

| Service Name      | Description                           | Language | Port |
|-------------------|---------------------------------------|----------|------|
| user-service      | Manages users and profiles            | Node.js  | 3001 |
| auth-service      | Handles authentication (JWT)          | Node.js  | 3002 |
| role-service      | Manages user roles and permissions    | Node.js  | 3003 |
| language-service  | Manages localization and languages    | Node.js  | 3004 |
| profile-service   | Handles user metadata and settings    | Node.js  | 3005 |

## 🧰 Technologies Used
- **Language**: Node.js
- **Framework**: Express.js
- **Auth**: JWT + CORS
- **API Style**: REST + Swagger UI
- **DevOps**: GitHub Actions, Docker
- **Observability**: Prometheus endpoints (future)
- **Tests**: Jest

## 📁 Structure Example
user-service/
├── src/
│ ├── controllers/
│ ├── routes/
│ ├── middleware/
│ └── index.js
├── Dockerfile
├── swagger.yaml
└── README.md

## 🚀 Running Locally

```bash
cd user-service
npm install
npm start
