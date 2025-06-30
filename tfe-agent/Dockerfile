FROM hashicorp/tfc-agent:latest

USER root
# add custom CA certificate, if needed
ADD certificate.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates

USER tfc-agent
