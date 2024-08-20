
FROM sonarqube:latest
ENV SONARQUBE_HOME=/opt/sonarqube
WORKDIR $SONARQUBE_HOME
EXPOSE 9000
ENTRYPOINT ["./bin/run.sh"]
