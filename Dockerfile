# Use a specific OpenJDK 11 base image
FROM openjdk

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file into the container at /app
COPY ./target/springrestapi-0.0.1-SNAPSHOT.jar /app/

# Command to run the application
CMD ["java", "-jar", "springrestapi-0.0.1-SNAPSHOT.jar"]
