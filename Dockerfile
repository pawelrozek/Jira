FROM centos:latest

RUN mkdir -p /installer \
    && chmod 777 /installer \
    && cd /installer

ADD "https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-software-8.4.2-x64.bin" /installer/

COPY ./response.varfile /installer/
COPY ./setenv.sh /installer/

RUN yum -y update \
    && yum install -y fontconfig \
    && chmod -R 777 /installer/ \
    && cd /installer \
    && ls -la \
    && ./atlassian-jira-software-8.4.2-x64.bin -q -varfile response.varfile \
    && rm -f /var/atlassian/application-data/.jira-home.lock \
    && mv -f /installer/setenv.sh /opt/atlassian/jira/bin/ \
    && rm -rf /installer

EXPOSE 8080
WORKDIR /opt/atlassian/jira
CMD ["/opt/atlassian/jira/bin/start-jira.sh", "-fg"]
