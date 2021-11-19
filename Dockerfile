FROM ubuntu:18.04

LABEL "com.github.actions.name"="Expect sftp Github Action"
LABEL "com.github.actions.description"="Expect sftp Github Action"
LABEL "com.github.actions.icon"="code"
LABEL "com.github.actions.color"="black"

RUN apt-get update && apt-get install -y expect ssh

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
