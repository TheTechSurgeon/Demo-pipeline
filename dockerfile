FROM eclipse-temurin:18

ARG JAR_FILE
COPY ${JAR_FILE} /app/app.jar
EXPOSE 8080

RUN adduser --disabled-password petclinic
USER petclinic

ENTRYPOINT ["java","-jar","/app/app.jar"]

