FROM patroni:latest

USER root

RUN apt-get update && \
    apt-get install -y python3-consul && \
    apt-get clean


USER postgres
