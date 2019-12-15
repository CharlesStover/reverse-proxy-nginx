FROM nginx:1.17.6-alpine
LABEL Author="Charles Stover"
WORKDIR /home

COPY src/crontab.txt /crontab.txt
COPY src/etc/nginx/nginx.conf /etc/nginx/nginx.conf
COPY src/home/dhparam.sh /home/dhparam.sh
COPY src/home/entrypoint.sh /home/entrypoint.sh

RUN /usr/bin/crontab /crontab.txt
RUN mkdir /var/www
RUN mkdir /var/www/certbot

RUN rm -rf /crontab.txt

ENTRYPOINT [ "/bin/bash", "/home/entrypoint.sh" ]

EXPOSE 80 443
