FROM tomcat:latest
COPY sweassignment2.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]
