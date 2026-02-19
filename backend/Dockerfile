# Stage 1: Build mit Gradle
FROM gradle:7-jdk17 AS build
WORKDIR /app
COPY . .
RUN gradle build

# Stage 2: Runtime-Image
FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app
COPY --from=build /app/build/libs/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
