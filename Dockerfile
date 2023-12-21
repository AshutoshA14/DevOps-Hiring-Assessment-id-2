# # Base image for the spring boot application
# FROM maven:3.8.4 AS Builder

# WORKDIR /opt/app

# COPY /spring-boot-app /opt/app

# RUN mvn clean package


FROM eclipse-temurin:17-jdk-alpine

# Argument to reference Artifact path location
ARG artifact=staging/demo-0.0.1-SNAPSHOT.jar

# Setting working directory for the container image
WORKDIR /opt/app

# Copying the arifact from designated path of the Artifact
COPY --from=Builder ${artifact} /opt/app/helloworld.jar

# Exposing the application on port 8080
EXPOSE 8080

# Running the application
ENTRYPOINT [ "java", "-jar", "helloworld.jar" ] 