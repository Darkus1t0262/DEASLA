# Alert Management Domain

The **Alert Management** domain is responsible for creating, validating, geo-targeting, scheduling, and templating emergency alerts in the DEAS-LA platform.

These services handle the generation of alerts before they are dispatched to citizens via the delivery system.

---

## 🧩 Microservices in This Domain

| Service Name        | Description                                   | Language | Framework     |
|---------------------|-----------------------------------------------|----------|----------------|
| alert-service       | Creates and manages alert messages            | Java     | Spring Boot    |
| schedule-service    | Handles scheduling of alert dispatch          | Java     | Spring Boot    |
| template-service    | Manages message templates                     | Java     | Spring Boot    |
| geo-service         | Handles geolocation targeting for alerts      | Java     | Spring Boot    |
| validation-service  | Validates alert data before dispatch          | Java     | Spring Boot    |

---

## ⚙️ Technologies Used

- **Language**: Java
- **Framework**: Spring Boot
- **Build Tool**: Maven
- **API Style**: REST
- **Dockerized**: Yes
- **Communication**: Kafka (planned for inter-domain events)
- **Observability**: Prometheus metrics (planned)

---

## 📁 Structure Example


---

## 🛠️ Running Locally

Each service can be built and run with:

```bash
./mvnw spring-boot:run
docker build -t alert-service .
docker run -p 3000:3000 alert-service
