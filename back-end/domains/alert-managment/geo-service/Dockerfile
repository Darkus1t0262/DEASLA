# Build Stage
FROM maven:3.9.6-eclipse-temurin-17 AS builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Runtime Stage
FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app
COPY --from=builder /app/target/geo-service-1.0.0.jar app.jar

# Expone el puerto 8082
EXPOSE 8082

# Define variables para que Spring Boot escuche en 0.0.0.0:8082
ENV JAVA_OPTS="-Dserver.port=8082 -Dserver.address=0.0.0.0"

# Ejecuta el servicio con esas variables
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
