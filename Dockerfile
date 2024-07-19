# Build stage
<<<<<<< HEAD

=======
>>>>>>> 27ec6d3c695c65c691cb5f13f02a3c91490a6702
FROM maven:3.8.4-openjdk-17-slim AS build
WORKDIR /app
COPY pom.xml /app/backend/
COPY src /app/backend/src
RUN mvn -f /app/backend/pom.xml clean package -Dmaven.test.failure.ignore=true

# Runtime stage
FROM openjdk:17-slim
WORKDIR /app
COPY --from=build /app/backend/target/backend-0.0.1-SNAPSHOT.jar app.jar

# Conditionally copy the uploads directory if it exists
RUN if [ -d "/app/backend/uploads" ]; then mkdir -p uploads && cp -r /app/backend/uploads/* uploads/; fi

EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
<<<<<<< HEAD



=======
>>>>>>> 27ec6d3c695c65c691cb5f13f02a3c91490a6702


#docker build -t chuthanh/dockerfile-backend:latest -f DockerfileBackend .
#docker push chuthanh/dockerfile-backend:latest
