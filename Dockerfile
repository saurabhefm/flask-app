# Example Jenkins Dockerfile, modify this to complete the challenge
FROM jenkins/jenkins:lts

USER root
RUN curl -sSL https://get.docker.com/|sh
RUN apt-get update && \
    apt-get install -y docker.io && \
    rm -rf /var/lib/apt/lists/*
RUN curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

RUN groupadd  jenkins && \
    useradd -m -s /bin/bash jenkins || true

RUN usermod -aG docker jenkins
USER jenkins
EXPOSE 8080 50000
CMD ["jenkins.sh"]

