#!/bin/bash
yum update -y
amazon-linux-extras install docker -y
systemctl start docker
systemctl enable docker
docker run -d -p 80:3000 ${docker_image}
