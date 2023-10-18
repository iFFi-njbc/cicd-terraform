# Use the official OpenJDK base image
FROM openjdk

# Set the working directory in the container
WORKDIR /app

# Copy the Maven executable JAR file and the POM file
COPY target/*.jar /app/app.jar

# Expose the port that the application will run on
EXPOSE 8080

# Entry point command to run the application
CMD ["java", "-jar", "springrestapi-0.0.1-SNAPSHOT.jar"]
