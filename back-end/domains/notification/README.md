# Notification Domain

The **Notification Domain** is responsible for orchestrating the sending of alerts and messages via different channels: broadcast, socket, retry queues, and more.

## 🔧 Microservices in This Domain

| Service Name       | Description                           | Language | Port |
|--------------------|---------------------------------------|----------|------|
| broadcast-service  | Manages mass alert broadcasting       | Python   | 4101 |
| channel-service    | Routes messages through channels      | Go       | 4102 |
| notification-core  | Central logic for notifications       | Node.js  | 4103 |
| retry-engine       | Handles failed message retries        | Python   | 4104 |
| socket-service     | Real-time alert delivery via WebSocket| Node.js  | 4105 |

## 🧰 Technologies Used
- **Languages**: Node.js, Python, Go
- **Frameworks**: Socket.IO, FastAPI, Express
- **Styles**: REST, WebSocket
- **DevOps**: GitHub Actions, Docker
- **Observability**: Prometheus + Grafana
- **Tests**: Jest, Pytest

## 📁 Structure Example

socket-service/  
├── src/  
│ ├── handlers/  
│ └── index.js  
├── Dockerfile  
└── README.md

## 🚀 Running Locally

```bash
cd socket-service
npm install
npm start
