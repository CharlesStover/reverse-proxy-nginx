#!/bin/sh

[ ! -f /etc/openssl/dhparam.pem ] && \
openssl dhparam -dsaparam -out /etc/openssl/dhparam.pem 4096;
