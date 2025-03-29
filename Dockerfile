FROM openjdk:11-jre-slim
WORKDIR /app
COPY target/joda-time-2.13.1.jar /app/app.jar  # Corrected file path
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
