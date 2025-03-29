# Example Dockerfile
FROM openjdk:11-jre-slim
WORKDIR /app
COPY target/*.jar /app/  # Ensure destination is a directory
CMD ["java", "-jar", "app.jar"]
