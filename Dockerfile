FROM maven:3.3-jdk-8
ADD . /usr/src/mymaven
RUN mvn clean install

# Pull base image 
FROM tomcat:8-jre8 

# Maintainer 
MAINTAINER "Marjook@gmail.com" 
COPY ./webapp.war /usr/local/tomcat/webapps

