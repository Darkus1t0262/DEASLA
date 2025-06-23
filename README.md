# 🌐 DEAS-LA - Distributed Emergency Alert System for Latin America

DEAS-LA is a distributed, scalable, event-driven system composed of **30 microservices** organized into **6 business domains**. The system leverages **5 programming languages**, **5 types of databases**, and **5 architectural communication styles** (REST, SOAP, WebSocket, Webhook, GraphQL).

---

## 🧭 System Diagrams

<p align="center">
  <!-- High & Low-Level Infrastructure -->
  <img src="docs/img/infra-high-low.png" width="800" alt="High and Low-Level AWS Infrastructure Diagram">
  <br><br>
  <!-- Process Flow -->
  <img src="docs/img/process-diagram.png" width="800" alt="Alert Flow and Processing Diagram">
  <br><br>
  <!-- Software Architecture -->
  <img src="docs/img/software-arch.png" width="700" alt="Domain-Centric Software Architecture Diagram">
</p>

---

## 🚀 Architecture Overview

- **Domains**: Core, Alert Management, Delivery & Logging, Notification, External Integration, Report  
- **Infrastructure**: AWS (EC2, Load Balancer, Auto Scaling Group), GitHub Actions, Docker, Terraform  
- **Observability**: Prometheus, Grafana, Cloudflare  

---

## ✅ QA & PROD Environments

- CI/CD using GitHub Actions  
- DevOps pipelines for build, push, and deploy  
- Functional testing for every microservice  
- Auto scaling and multi-AZ support in production  

---

## 🗃️ Tech Stack

- **Languages**: Node.js, Python, Java, Go, PHP  
- **Databases**: PostgreSQL, MySQL, MongoDB, Redis, Neo4j  
- **Communication Styles**: REST, Webhook, WebSocket, SOAP, GraphQL  

---

## 🔍 Monitoring & Observability

- **Metrics**: Real-time observability with Prometheus + Grafana  
- **Logs**: Centralized via logging-service  
- **Alerts**: Triggered through CloudWatch + delivery via Email, SMS, Push  

---

## 📁 Project Structure

```plaintext
├── .github/workflows              # CI/CD pipelines
├── domains                        # Business logic split by domain
│   ├── core
│   ├── alert-management
│   ├── delivery-logging-services
│   ├── notification
│   ├── external
│   └── report
├── docker-infra                   # Docker services and databases
├── docker-monitoring              # Prometheus, Grafana, exporters
├── docker-gateway                 # API Gateway and routing services
├── terraform                      # Infrastructure as Code (IaC)
├── docs
│   └── img                        # System and architecture diagrams
│       ├── infra-high-low.png
│       ├── process-diagram.png
│       └── software-arch.png
├── .env                           # Environment variables
├── build-*.sh                     # Domain-specific build scripts
