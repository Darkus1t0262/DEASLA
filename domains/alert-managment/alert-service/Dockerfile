FROM maven:3.9.6-eclipse-temurin-17-alpine AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=build /app/target/alert-service-1.0.0.jar app.jar

# Aseguramos que escuche en el puerto 8081 y en 0.0.0.0
ENV JAVA_OPTS="-Dserver.port=8081 -Dserver.address=0.0.0.0"

EXPOSE 8081

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
