# Use a minimal base image to reduce the attack surface
FROM eclipse-temurin:18

# Metadata indicating the maintainer of the image
LABEL maintainer="your@email.com"


# Dockerfile
FROM openjdk:17-jdk-slim
ARG JAR_FILE
COPY ${JAR_FILE} /app/app.jar
ENTRYPOINT ["java","-jar","/app/app.jar"]

