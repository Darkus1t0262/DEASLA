#!/bin/bash
echo "Building and pushing Docker images for domain: alert-management" 
echo "Processing alert-service..."
cd $(find domains -type d -name "alert-service") || exit 1
docker build -t darkjus/alert-service:latest .
docker push darkjus/alert-service:latest
cd - > /dev/null || exit 1

echo "Processing schedule-service..."
cd $(find domains -type d -name "schedule-service") || exit 1
docker build -t darkjus/schedule-service:latest .
docker push darkjus/schedule-service:latest
cd - > /dev/null || exit 1

echo "Processing template-service..."
cd $(find domains -type d -name "template-service") || exit 1
docker build -t darkjus/template-service:latest .
docker push darkjus/template-service:latest
cd - > /dev/null || exit 1

echo "Processing geo-service..."
cd $(find domains -type d -name "geo-service") || exit 1
docker build -t darkjus/geo-service:latest .
docker push darkjus/geo-service:latest
cd - > /dev/null || exit 1

echo "Processing validation-service..."
cd $(find domains -type d -name "validation-service") || exit 1
docker build -t darkjus/validation-service:latest .
docker push darkjus/validation-service:latest
cd - > /dev/null || exit 1

echo "Finished building all alert-management services."
