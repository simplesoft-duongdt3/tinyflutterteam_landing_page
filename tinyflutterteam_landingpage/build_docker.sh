flutter build web --web-renderer canvaskit
docker build -t tinyflutterteam.com:latest .
docker images
docker run -d -p 80:80 tinyflutterteam.com:latest
curl localhost:80

# remove image None
# docker image prune
#docker rmi $(docker images -f "dangling=true" -q)
# transfer image by SSH
# docker save tinyflutterteam.com:latest | bzip2 | ssh root@103.221.220.249 docker load