# Pull base image 
From tomcat:8-jre8
COPY ./webapp/target/webapp.war /usr/local/tomcat/ROOT.war

