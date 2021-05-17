FROM alpine:3.10

RUN apk update && \
    mkdir -p /run/nginx && \
    apk add nginx curl bash jq

ADD files/default.conf /etc/nginx/conf.d/default.conf
ADD files/register_start.sh files/cronscript.sh files/start.sh ./
RUN chmod +x /start.sh /cronscript.sh /register_start.sh
EXPOSE 80 443
USER root

CMD ./start.sh
