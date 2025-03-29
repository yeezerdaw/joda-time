FROM openjdk:11-jre-slim
WORKDIR /app

# Copy the jar file into the container from the local target directory
COPY target/joda-time-2.13.1.jar /app/app.jar

# Define the entry point to run the jar file
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
