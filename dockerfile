# Use a minimal base image to reduce the attack surface
FROM eclipse-temurin:18

# Metadata indicating the maintainer of the image
LABEL maintainer="your@email.com"


FROM openjdk:11-jdk-slim
COPY ${env.JAR_NAME} /app/app.jar
ENTRYPOINT ["java","-jar","/app/app.jar"]

