FROM maven:3.9.6-eclipse-temurin-17-alpine AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=build /app/target/template-service-1.0.0.jar app.jar

# Forzar Spring Boot a escuchar en el puerto 8083 y en 0.0.0.0
ENV JAVA_OPTS="-Dserver.port=8083 -Dserver.address=0.0.0.0"

EXPOSE 8083

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
