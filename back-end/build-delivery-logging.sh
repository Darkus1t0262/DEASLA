#!/bin/bash
echo "Building and pushing Docker images for domain: delivery-logging" 
echo "Processing email-service..."
cd $(find domains -type d -name "email-service") || exit 1
docker build -t darkjus/email-service:latest .
docker push darkjus/email-service:latest
cd - > /dev/null || exit 1

echo "Processing sms-service..."
cd $(find domains -type d -name "sms-service") || exit 1
docker build -t darkjus/sms-service:latest .
docker push darkjus/sms-service:latest
cd - > /dev/null || exit 1

echo "Processing push-service..."
cd $(find domains -type d -name "push-service") || exit 1
docker build -t darkjus/push-service:latest .
docker push darkjus/push-service:latest
cd - > /dev/null || exit 1

echo "Processing logging-service..."
cd $(find domains -type d -name "logging-service") || exit 1
docker build -t darkjus/logging-service:latest .
docker push darkjus/logging-service:latest
cd - > /dev/null || exit 1

echo "Processing retry-service..."
cd $(find domains -type d -name "retry-service") || exit 1
docker build -t darkjus/retry-service:latest .
docker push darkjus/retry-service:latest
cd - > /dev/null || exit 1

echo "Finished building all delivery-logging services."
