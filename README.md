# DEAS-LA - Distributed Emergency Alert System for Latin America

DEAS-LA is a distributed, scalable, event-driven system composed of **30 microservices** organized into **6 business domains**. The system leverages **5 programming languages**, **5 types of databases**, and **5 architectural communication styles** (REST, SOAP, WebSocket, Webhook, GraphQL).

## 🚀 Architecture Overview
- **Domains**: Core, Alert Management, Delivery & Logging, Notification, External Integration, Report
- **Infrastructure**: AWS (EC2, Load Balancer, Auto Scaling Group), GitHub Actions, Docker, Terraform
- **Observability**: Prometheus, Grafana, Cloudflare

## ✅ QA & PROD Environments
- CI/CD with GitHub Actions
- DevOps pipelines for build, push, deploy
- Functional testing per microservice

## 🗃️ Tech Stack
- **Languages**: Node.js, Python, Java, Go, PHP
- **Databases**: PostgreSQL, MySQL, MongoDB, Redis, Neo4j
- **Communication Styles**: REST, Webhook, WebSocket, SOAP, GraphQL

## 🔍 Monitoring & Observability

Real-time metrics: Prometheus + Grafana

Logs: Centralized via logging-service

Alerts via CloudWatch + Email/SMS/Push

## 🔧 Project Structure
```plaintext
├── .github/workflows
├── domains
│   ├── core
│   ├── alert-management
│   ├── delivery-logging-services
│   ├── notification
│   ├── external
│   └── report
├── docker-infra
├── docker-monitoring
├── docker-gateway
├── terraform

