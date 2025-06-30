FROM maven:3.9.6-eclipse-temurin-17-alpine AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=build /app/target/validation-service-1.0.0.jar app.jar

# Asegura que Spring Boot escuche en todas las interfaces y el puerto correcto
ENV JAVA_OPTS="-Dserver.port=8085 -Dserver.address=0.0.0.0"

EXPOSE 8085

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
