FROM maven:3.3-jdk-8 AS build
COPY . /usr/src/mymaven
WORKDIR /usr/src/mymaven
RUN ls- la
RUN mvn clean package

# Pull base image 
FROM tomcat:8-jre8 
COPY --from=build ./webapp/target/webapp.war /usr/local/tomcat/webapps
