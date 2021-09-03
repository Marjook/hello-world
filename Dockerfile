FROM maven:3.3-jdk-8 AS build
COPY . /usr/src/mymaven
WORKDIR /usr/src/mymaven
RUN mvn clean package
RUN ls -lart ./*
# Pull base image 
FROM tomcat:8-jre8 
COPY --from=build /usr/src/mymaven/webapp/target/webapp.war /usr/local/tomcat/webapps
