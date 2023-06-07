# Use a minimal base image to reduce the attack surface
FROM FROM eclipse-temurin:18

# Metadata indicating the maintainer of the image
LABEL maintainer="your@email.com"


# Add a non-root user to run our application
RUN addgroup --system java && adduser --system --group java

# Change to the /app directory
WORKDIR /app

ARG JAR_FILE
COPY ${JAR_FILE} app.jar


# Ensure the application runs as the non-root user
USER java

# Run the application
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
