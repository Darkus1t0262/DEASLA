#!/bin/bash
echo "Building and pushing Docker images for domain: report" 
echo "Processing metrics-collector..."
cd $(find domains -type d -name "metrics-collector") || exit 1
docker build -t darkjus/metrics-collector:latest .
docker push darkjus/metrics-collector:latest
cd - > /dev/null || exit 1

echo "Processing report-generator..."
cd $(find domains -type d -name "report-generator") || exit 1
docker build -t darkjus/report-generator:latest .
docker push darkjus/report-generator:latest
cd - > /dev/null || exit 1

echo "Processing audit-trail..."
cd $(find domains -type d -name "audit-trail") || exit 1
docker build -t darkjus/audit-trail:latest .
docker push darkjus/audit-trail:latest
cd - > /dev/null || exit 1

echo "Processing feedback-service..."
cd $(find domains -type d -name "feedback-service") || exit 1
docker build -t darkjus/feedback-service:latest .
docker push darkjus/feedback-service:latest
cd - > /dev/null || exit 1

echo "Processing stat-analyzer..."
cd $(find domains -type d -name "stat-analyzer") || exit 1
docker build -t darkjus/stat-analyzer:latest .
docker push darkjus/stat-analyzer:latest
cd - > /dev/null || exit 1

echo "Finished building all report services."
