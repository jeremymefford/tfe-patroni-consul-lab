FROM haproxy:latest

USER root
RUN mkdir -p /run/haproxy
RUN chown haproxy:haproxy /run/haproxy

RUN mkdir -p /var/lib/haproxy
RUN chown haproxy:haproxy /var/lib/haproxy
RUN chmod 755 /var/lib/haproxy

USER haproxy

COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
