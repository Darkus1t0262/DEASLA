#!/bin/bash
yum update -y
amazon-linux-extras install docker -y
systemctl start docker
systemctl enable docker

%{ for image in docker_images ~}
docker run -d -p 0:3000 ${image}
%{ endfor ~}
