#!/bin/bash
echo "Building and pushing Docker images for domain: external" 
echo "Processing graphql-gateway..."
cd $(find domains -type d -name "graphql-gateway") || exit 1
docker build -t darkjus/graphql-gateway:latest .
docker push darkjus/graphql-gateway:latest
cd - > /dev/null || exit 1

echo "Processing webhook-service..."
cd $(find domains -type d -name "webhook-service") || exit 1
docker build -t darkjus/webhook-service:latest .
docker push darkjus/webhook-service:latest
cd - > /dev/null || exit 1

echo "Processing soap-consumer..."
cd $(find domains -type d -name "soap-consumer") || exit 1
docker build -t darkjus/soap-consumer:latest .
docker push darkjus/soap-consumer:latest
cd - > /dev/null || exit 1

echo "Processing external-push..."
cd $(find domains -type d -name "external-push") || exit 1
docker build -t darkjus/external-push:latest .
docker push darkjus/external-push:latest
cd - > /dev/null || exit 1

echo "Processing channel-validator..."
cd $(find domains -type d -name "channel-validator") || exit 1
docker build -t darkjus/channel-validator:latest .
docker push darkjus/channel-validator:latest
cd - > /dev/null || exit 1

echo "Finished building all external services."
