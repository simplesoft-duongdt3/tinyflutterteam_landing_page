# step 1

docker run --detach \
    --name nginx-proxy \
    --restart=always \
    --publish 80:80 \
    --publish 443:443 \
    --volume certs:/etc/nginx/certs \
    --volume vhost:/etc/nginx/vhost.d \
    --volume html:/usr/share/nginx/html \
    --volume /var/run/docker.sock:/tmp/docker.sock:ro \
    nginxproxy/nginx-proxy


# step 2
docker run --detach \
    --name nginx-proxy-acme \
    --restart=always \
    --volumes-from nginx-proxy \
    --volume /var/run/docker.sock:/var/run/docker.sock:ro \
    --volume acme:/etc/acme.sh \
    --env "DEFAULT_EMAIL=doanthanhduong11031990@gmail.com" \
    nginxproxy/acme-companion

# step 3
docker run --detach \
    --name tinyflutterteam_landing_page \
    --restart=always \
    --env "VIRTUAL_HOST=tinyflutterteam.com" \
    --env "VIRTUAL_PORT=80" \
    --env "LETSENCRYPT_HOST=tinyflutterteam.com" \
    --env "LETSENCRYPT_EMAIL=doanthanhduong11031990@gmail.com" \
    tinyflutterteam.com:latest