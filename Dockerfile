# Use the official SonarQube image as the base
FROM sonarqube:latest

# Install Trivy
RUN apt-get update && apt-get install -y wget \
    && wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | apt-key add - \
    && echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | tee -a /etc/apt/sources.list.d/trivy.list \
    && apt-get update \
    && apt-get install -y trivy

# Run SonarQube and Trivy
CMD ["sh", "-c", "/opt/sonarqube/bin/run.sh & trivy --version"]

# Expose the necessary ports for SonarQube
EXPOSE 9000
