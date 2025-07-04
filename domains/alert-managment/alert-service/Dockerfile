FROM maven:3.9.6-eclipse-temurin-17-alpine AS build
WORKDIR /app

# Aprovechamos cache para dependencias
COPY pom.xml .
RUN mvn dependency:go-offline

# Copiamos todo el código fuente
COPY src ./src

# Compilamos el proyecto (sin tests)
RUN mvn clean package -DskipTests

# Imagen final
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# Copiamos solo el JAR generado
COPY --from=build /app/target/alert-service-1.0.0.jar app.jar

# Exponemos el puerto de la aplicación
EXPOSE 8081

# Ejecutamos Spring Boot
ENTRYPOINT ["java", "-jar", "app.jar"]
