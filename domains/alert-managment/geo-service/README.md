# geo-service

**Domain:** Alert Management  
**Service:** geo-service  
**Language:** Java  
**Framework:** Spring Boot  
**Architecture Style:** REST API  
**Database:** In-memory (HashMap; easy to replace with MongoDB/PostgreSQL)  
**Patterns:** Service, Repository  
**QA/PROD Checklist:** This service fulfills requirements for geotargeting, API documentation, containerization, and automated tests.

---

## 📝 Description

The `geo-service` microservice is responsible for managing geographical zones (polygons) for geotargeted alerts in the DEAS-LA system. It provides endpoints to register, list, and query if a coordinate falls within a defined zone, enabling accurate and location-based emergency alerts.

---

## ⚙️ Technologies

- Java 17
- Spring Boot 3.x
- REST API (JSON)
- Docker

---

## 📚 Endpoints

| Method | Path                                | Description                             |
|--------|-------------------------------------|-----------------------------------------|
| GET    | `/api/geo/zones`                    | List all geo-zones                      |
| POST   | `/api/geo/zones`                    | Register a new geo-zone                 |
| POST   | `/api/geo/zones/{zoneId}/contains`  | Check if point is inside a geo-zone     |

### Example: Check if a point is inside a zone

```bash
POST /api/geo/zones/{zoneId}/contains
Content-Type: application/json

{
  "lat": -0.214,
  "lon": -78.514
}

{
  "inside": true
}


# Run Locally

# Build the jar
mvn clean package

# Build Docker image
docker build -t geo-service .

# Run service
docker run -p 8082:8082 geo-service