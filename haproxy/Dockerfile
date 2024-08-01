FROM haproxy:latest

COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg

ENTRYPOINT ["haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]