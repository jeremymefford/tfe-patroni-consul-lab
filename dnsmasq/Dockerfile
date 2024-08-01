FROM alpine:latest
RUN apk add --no-cache dnsmasq lsof bind-tools iproute2
COPY dnsmasq.conf /etc/dnsmasq.conf
CMD ["dnsmasq", "-k"]