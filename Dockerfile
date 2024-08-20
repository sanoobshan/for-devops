# Use the official SonarQube image as the base
FROM sonarqube:latest

# Install dependencies and Trivy
USER root
RUN apt-get update && apt-get install -y wget gnupg lsb-release \
    && wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | apt-key add - \
    && echo "deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | tee -a /etc/apt/sources.list.d/trivy.list \
    && apt-get update \
    && apt-get install -y trivy \
    && rm -rf /var/lib/apt/lists/*

# Expose the necessary ports for SonarQube
EXPOSE 9000

# Run SonarQube
CMD ["bin/run.sh"]
