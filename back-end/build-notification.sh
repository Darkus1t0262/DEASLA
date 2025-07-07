#!/bin/bash
echo "Building and pushing Docker images for domain: notification" 
echo "Processing broadcast-service..."
cd $(find domains -type d -name "broadcast-service") || exit 1
docker build -t darkjus/broadcast-service:latest .
docker push darkjus/broadcast-service:latest
cd - > /dev/null || exit 1

echo "Processing socket-service..."
cd $(find domains -type d -name "socket-service") || exit 1
docker build -t darkjus/socket-service:latest .
docker push darkjus/socket-service:latest
cd - > /dev/null || exit 1

echo "Processing channel-service..."
cd $(find domains -type d -name "channel-service") || exit 1
docker build -t darkjus/channel-service:latest .
docker push darkjus/channel-service:latest
cd - > /dev/null || exit 1

echo "Processing retry-engine..."
cd $(find domains -type d -name "retry-engine") || exit 1
docker build -t darkjus/retry-engine:latest .
docker push darkjus/retry-engine:latest
cd - > /dev/null || exit 1

echo "Processing notification-core..."
cd $(find domains -type d -name "notification-core") || exit 1
docker build -t darkjus/notification-core:latest .
docker push darkjus/notification-core:latest
cd - > /dev/null || exit 1

echo "Finished building all notification services."
