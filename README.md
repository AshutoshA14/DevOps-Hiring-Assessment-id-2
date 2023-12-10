# DevOps-Hiring-Assessment-id-2

## Hello World Spring Boot Application

Creating a project in Spring Boot typically involves using a build tool like Maven or Gradle, and you can use the Spring Initializr to generate a basic project structure. Here are the steps to create a Spring Boot project:

 ## Openjdk version
  
  #### I have used Java version as `Openjdk-17` to build this project.

  To check java version installed into the system use the `java --version` command.

  ```openjdk 17.0.9 2023-10-17 LTS
     OpenJDK Runtime Environment Microsoft-8552009 (build 17.0.9+8-LTS)
     OpenJDK 64-Bit Server VM Microsoft-8552009 (build 17.0.9+8-LTS, mixed mode, sharing)
 ```

 ## Using Spring Initializr:

 **Spring Boot ::(v3.2.0)** 

 The general format:

**MAJOR.MINOR.PATCH**,e.g `1.0.1`

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes

### Visit the Spring Initializr Website:

Open your web browser and go to the Spring Initializr website.
[Spring Intializer](https://start.spring.io/)

### Configure Your Project:

- Choose the project type (Maven or Gradle).
- Select the language (Java, Kotlin, Groovy).
- Set the Spring Boot version.
- Add dependencies (e.g., Web, JPA, Security) based on your project requirements.

### Generate Project:

Click on the "Generate" button. This will download a ZIP file containing your Spring Boot project.

### Extract ZIP File:

Extract the contents of the downloaded ZIP file to your desired location.

### IDE Integration:

If you're using an integrated development environment (IDE) like IntelliJ IDEA or Eclipse, VsCode, you can import the project directly into the IDE after it's generated.

### Building and Running:

Regardless of how you create the project, you can build and run it using the following commands:
Move into the spring boot application source code directory to execute below commands e.g.- `cd /spring-boot-app`

Using Maven:

```
mvn clean install
mvn spring-boot:run

```

Using Gradle:

```
./gradlew clean build
./gradlew bootRun

```

This will build and run your Spring Boot application. Once the application is running, you can access it by visiting [How to Check Application after running the above commands](http://localhost:8080) in your web browser (assuming the default port).


## Dockerfile Creation for Hello World SPRING BOOT application

To Create a Dockerfile for a Spring Boot application involves specifying the necessary steps to build and run your application inside a Docker container. Below are the typical steps for creating a Dockerfile for a Spring Boot application:

To get detailed iinformation on [How to create a Dockerfile](https://docs.docker.com/engine/reference/builder/),must visit the given link.


### Base Image:

Start with a base image that includes the Java Runtime Environment (JRE). For Spring Boot, I have used `eclipse-temurin:17-jre-alpine` as a base image.

```
FROM eclipse-temurin:17-jre-alpine
```
Choose the appropriate Java version based on your Spring Boot application's compatibility.

### Argument defintion for stroing the Artifact location

Set the path of your artifact using Build arguments.It is helpful in buildiing an image efficiently.

```
ARG artifact=spring-boot-app/target/demo-0.0.1-SNAPSHOT.jar
```
### Working Directory inside the Container image

Set the working directory for your container where the hello world app code resides.

```
WORKDIR /opt/apt
```

### Copy JAR file into the image

Copy the JAR file of the application generated as artifact into the image.Location of the JAR file may vary based on the location set by you in the previous step.I have modified the JAR file name inside the image as per my neccessity, you may also modify as per your need.Also, used **interpolation** method to refer the artifact argument as defined above.

```
COPY ${artifact} helloworld.jar
```

### Expose the port where the Hello World Application is running

Expose the port on which your application is running inside the container.This may vary based onn your choice and can be configured inside the **application.properties** file of your spring boot application.

```
EXPOSE 8080
```

### Command to run the application

You must specify the command to run the application when the container first started.For this, you can use *ENTRYPOINT* to run the application.

```

ENTRYPOINT ["java", "-jar", "helloworld.jar"]
```

### Build the Docker image for your Spring boot application

To build the image using Dockerfile The follwing are the steps needs to be followed :

- your image registry details ** Store the image into a specified path in the registry** .
- Registry location with Repository name 
- Must specify the image version
- ** . ** this specify the path of your Dockerfile inside your github repo.

```
docker build -t Registry_name/image_name:image_tag .
```

#-------------------------------------------------------------------------------------------------------------------------------

## AWS ECR and IAM role setup

### AWS ECR setup using bash script

Configure and 