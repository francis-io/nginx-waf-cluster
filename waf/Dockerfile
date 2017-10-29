FROM ubuntu:16.04

COPY build.sh /build.sh
RUN chmod +x /build.sh && /bin/bash -c "source /build.sh"

# multi stage build
FROM ubuntu:16.04

COPY config.multi.sh /config.multi.sh

COPY --from=0 /usr/src/modsecurity/ /usr/src/modsecurity/
COPY --from=0 /usr/local/nginx/ /usr/local/nginx/

RUN chmod +x /config.multi.sh && /bin/bash -c "source /config.multi.sh"

COPY nginx.conf /usr/local/nginx/conf/nginx.conf
COPY modsec_includes.conf /usr/local/nginx/conf/modsec_includes.conf
COPY modsecurity.conf /usr/local/nginx/conf/modsecurity.conf
COPY crs-setup.conf /usr/local/nginx/conf/rules/crs-setup.conf

CMD nginx -g 'daemon off;'
