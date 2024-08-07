FROM alpine:latest
RUN apk add --no-cache lsof bind-tools iproute2 bash curl jq postgresql-client
COPY chaos-monkey.sh /etc/chaos-monkey.sh
CMD ["/bin/bash", "/etc/chaos-monkey.sh"]