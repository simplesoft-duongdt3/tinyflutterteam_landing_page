docker buildx create --name mybuilder
docker buildx use mybuilder
docker buildx inspect --bootstrap

# export
docker buildx build --platform linux/amd64 -o type=tar,dest=amd64_image.tar .

# import
docker import amd64_image.tar tinyflutterteam:v1.0.0


# docker buildx build --platform linux/arm,linux/arm64,linux/amd64 -o type=tar,dest=out_images.tar .


# docker buildx build --platform linux/arm,linux/arm64,linux/amd64 -o . -t tinyflutterteam.com  .
# docker buildx imagetools inspect tinyflutterteam.com

# transfer image by SSH
# docker save tinyflutterteam.com:latest | bzip2 | ssh root@103.221.220.249 docker load

# docker buildx build --platform linux/amd64 -o type=docker,dest=- . | bzip2 | ssh root@103.221.220.249 docker load