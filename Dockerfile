# Build stage

# FROM maven:3.8.4-openjdk-17-slim AS build
# WORKDIR /opt
# COPY target/*.jar /opt/app.jar
# ENTRYPOINT exec java $JAVA_OPTS -jar app.jar



FROM maven:3.8.4-openjdk-17-slim AS build


WORKDIR /opt

COPY . .

# Run Maven to clean and install the project, which will build the JAR file
# RUN mvn clean install

# Use a separate, smaller image for the final stage
FROM openjdk:17-slim

# Set the working directory for the final stage
WORKDIR /opt

COPY --from=build /opt/target/*.jar /opt/app.jar

ENTRYPOINT exec java $JAVA_OPTS -jar app.jar



#docker build -t chuthanh/dockerfile-backend:latest -f Dockerfile .
#docker push chuthanh/dockerfile-backend:latest
