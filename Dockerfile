FROM maven:3.3-jdk-8 AS build
RUN apt add -U git
RUN ls -la
#RUN mvn clean package

# Pull base image 
FROM tomcat:8-jre8 
COPY --from=build ./webapp/target/webapp.war /usr/local/tomcat/webapps
