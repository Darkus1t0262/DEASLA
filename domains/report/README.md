
# Report Domain

The **Report Domain** focuses on metrics, analytics, and historical traceability by processing audit logs and user feedback.

## 🔧 Microservices in This Domain

| Service Name        | Description                              | Language | Port |
|---------------------|------------------------------------------|----------|------|
| audit-trail         | Captures all critical actions            | Go       | 4201 |
| feedback-service    | Collects user feedback                   | Node.js  | 4202 |
| metrics-collector   | Gathers Prometheus-based metrics         | Python   | 4203 |
| report-generator    | Generates PDF/CSV reports                | Java     | 4204 |
| stat-analyzer       | Analyzes and summarizes system activity  | Python   | 4205 |

## 🧰 Technologies Used
- **Languages**: Go, Python, Java, Node.js
- **API Style**: REST, RPC
- **DevOps**: GitHub Actions, Docker
- **Monitoring**: Prometheus
- **Reporting**: CSV, PDF exports
- **Tests**: Go test, Pytest, JUnit

## 📁 Structure Example

report-generator/  
├── src/  
│ └── main/java/com/deasla/report/  
├── Dockerfile  
└── README.md

## 🚀 Running Locally

```bash
cd report-generator
./gradlew bootRun
