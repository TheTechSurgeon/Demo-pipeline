# Use a minimal base image to reduce the attack surface
FROM adoptopenjdk:18-jdk-hotspot

# Metadata indicating the maintainer of the image
LABEL maintainer="your@email.com"


# Add a non-root user to run our application
RUN addgroup --system java && adduser --system --group java

# Change to the /app directory
WORKDIR /app

# Copy the jar to the production image from the builder stage.
COPY ${WORKSPACE}/target/spring-petclinic-3.1.0-SNAPSHOT.jar /app/spring-petclinic-3.1.0-SNAPSHOT.jar

# Ensure the application runs as the non-root user
USER java

# Run the application
ENTRYPOINT ["java", "-jar", "/app/spring-petclinic-3.1.0-SNAPSHOT.jar"]
