# External Domain

The **External Domain** of the DEAS-LA project integrates with third-party systems and external consumers, including GraphQL APIs, SOAP consumers, and Webhook interactions.

## 🔧 Microservices in This Domain

| Service Name       | Description                                  | Language | Port |
|--------------------|----------------------------------------------|----------|------|
| graphql-gateway    | Aggregates data using GraphQL                | Node.js  | 4001 |
| soap-consumer      | Handles communication via SOAP               | Python   | 4002 |
| webhook-service    | Listens and processes external webhooks      | Node.js  | 4003 |
| external-push      | Manages push requests from outside systems   | Python   | 4004 |
| channel-validator  | Validates channels for third-party use       | Go       | 4005 |

## 🧰 Technologies Used
- **Languages**: Node.js, Python, Go
- **Protocols**: GraphQL, SOAP, WebHook
- **API Style**: REST + GraphQL + Swagger
- **DevOps**: GitHub Actions, Docker
- **Observability**: Prometheus exporters
- **Tests**: Jest, Pytest

## 📁 Structure Example

graphql-gateway/  
├── src/  
│ ├── resolvers/  
│ ├── schemas/  
│ └── index.js  
├── Dockerfile  
├── swagger.yaml  
└── README.md

## 🚀 Running Locally

```bash
cd graphql-gateway
npm install
npm start
