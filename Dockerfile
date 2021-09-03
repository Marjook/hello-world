FROM maven:3.3-jdk-8 AS build
RUN ls -la ./workspace
RUN cd /hello-world
RUN mvn clean package

# Pull base image 
FROM tomcat:8-jre8 
COPY --from=build ./webapp/target/webapp.war /usr/local/tomcat/webapps
