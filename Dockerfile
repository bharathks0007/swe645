FROM tomcat:latest
COPY Swe645Assignment1.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]
