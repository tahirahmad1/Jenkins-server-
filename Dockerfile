FROM jenkins/jenkins:2.374-jdk11

USER root

RUN apt-get update && \

    apt-get install -y ca-certificates curl gnupg lsb-release && \

    mkdir -p /etc/apt/keyrings && \

    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \

    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \

    $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \

    apt-get update && \

    apt-get install -y docker-ce docker-ce-cli containerd.io && \

    groupmod -g 999 docker && \

    usermod -aG docker jenkins

RUN apt-get update && apt-get -y install mysql-client

RUN curl -sSL --create-dirs -o /tmp/WEB-INF/plugins/database.hpi https://updates.jenkins-ci.org/latest/database.hpi \

  && curl -sSL --create-dirs -o /tmp/WEB-INF/plugins/database-mysql.hpi https://updates.jenkins-ci.org/latest/database-mysql.hpi \

  && cd /tmp && zip -g /usr/share/jenkins/jenkins.war WEB-INF/*/* && rm -rf /tmp/WEB-IN apt-get update && apt-get -y install mysql-client

RUN curl -sSL --create-dirs -o /tmp/WEB-INF/plugins/database.hpi https://updates.jenkins-ci.org/latest/database.hpi \

  && curl -sSL --create-dirs -o /tmp/WEB-INF/plugins/database-mysql.hpi https://updates.jenkins-ci.org/latest/database-mysql.hpi \

  && cd /tmp && zip -g /usr/share/jenkins/jenkins.war WEB-INF/*/* && rm -rf /tmp/WEB-INF

USER jenkins

