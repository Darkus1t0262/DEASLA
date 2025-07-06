#!/bin/bash
yum update -y
amazon-linux-extras install docker -y
systemctl start docker
systemctl enable docker

# Start each container on different ports
PORT=3001
%{ for image in docker_images ~}
docker run -d -p ${PORT}:${PORT} --name $(basename ${image}) ${image}
PORT=$((PORT+1))
%{ endfor ~}
