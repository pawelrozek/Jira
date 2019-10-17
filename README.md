Created by Pawel Rozek on October 17, 2019

Atlassian Jira 8.4.2

Based on latest CentOS

Home Directory can be mapped as  /var/atlassian/application-data/

Port to be exposed is 8080

Installation directory /opt/atlassian/jira

# How to install: #
Pre-Requesits:
   - Docker and Docker Compose installed.
   - 2 directories created for docker-compose.yml file to work.
      - /opt/atlassian
      - /opt/jiralogs
1. Clone files to Directory on your local machine
2. Build image: docker build -t "jira:8.4.2" ./
3. Run docker-compose up -d
4. Go to http://localhost:8080
