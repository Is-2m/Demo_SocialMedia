# Build stage
FROM docker.io/library/maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Run stage
FROM docker.io/library/tomcat:10.1.14-jdk17-temurin-jammy
WORKDIR /usr/local/tomcat/webapps/
COPY --from=build /app/target/TP2_JEE-1.0.war ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]