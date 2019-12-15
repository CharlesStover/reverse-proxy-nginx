# Reverse Proxy (nginx)

The nginx layer of a containerized reverse proxy.

## Build

```
docker build --file Dockerfile --tag charlesstover/reverse-proxy-nginx .;
```

## Run

```
docker run \
  --detach \
  --name reverse-proxy-nginx \
  --network reverse-proxy \
  --publish 80:80 \
  --publish 443:443 \
  --restart always \
  --volume /PATH/TO/etc/letsencrypt:/etc/letsencrypt \
  --volume /PATH/TO/etc/nginx/conf.d:/etc/nginx/conf.d \
  --volume /PATH/TO/etc/openssl:/etc/openssl \
  --volume /PATH/TO/var/log/reverse-proxy-nginx:/var/log/nginx \
  --volume /PATH/TO/var/www/certbot:/var/www/certbot \
  charlesstover/reverse-proxy-nginx;
```

Your SSL certificates will be retrieved from `/PATH/TO/etc/letsencrypt`. It
needs to match the path provided to
[reverse-proxy-certbot](https://github.com/CharlesStover/reverse-proxy-certbot).

Your nginx `.conf` files should be located in the `/PATH/TO/etc/nginx/conf.d`
directory.

Your `dhparam.pem` file should be located in the `/PATH/TO/etc/openssl`
directory. If one does not exist in this location, one will be generated.

Your error and access logs will be written to the
`/PATH/TO/var/log/reverse-proxy-nginx` directory.

Your certbot challenges will be served from `/PATH/TO/var/www/certbot`. It needs
to match the path provided to
[reverse-proxy-certbot](https://github.com/CharlesStover/reverse-proxy-certbot).
