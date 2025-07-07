#!/bin/bash
echo "Starting build and push of all microservices..."
echo "Building and pushing user-service..."
cd $(find domains -type d -name "user-service") || exit 1
docker build -t darkjus/user-service:latest .
docker push darkjus/user-service:latest
cd - > /dev/null || exit 1

echo "Building and pushing auth-service..."
cd $(find domains -type d -name "auth-service") || exit 1
docker build -t darkjus/auth-service:latest .
docker push darkjus/auth-service:latest
cd - > /dev/null || exit 1

echo "Building and pushing role-service..."
cd $(find domains -type d -name "role-service") || exit 1
docker build -t darkjus/role-service:latest .
docker push darkjus/role-service:latest
cd - > /dev/null || exit 1

echo "Building and pushing profile-service..."
cd $(find domains -type d -name "profile-service") || exit 1
docker build -t darkjus/profile-service:latest .
docker push darkjus/profile-service:latest
cd - > /dev/null || exit 1

echo "Building and pushing language-service..."
cd $(find domains -type d -name "language-service") || exit 1
docker build -t darkjus/language-service:latest .
docker push darkjus/language-service:latest
cd - > /dev/null || exit 1

echo "Building and pushing alert-service..."
cd $(find domains -type d -name "alert-service") || exit 1
docker build -t darkjus/alert-service:latest .
docker push darkjus/alert-service:latest
cd - > /dev/null || exit 1

echo "Building and pushing schedule-service..."
cd $(find domains -type d -name "schedule-service") || exit 1
docker build -t darkjus/schedule-service:latest .
docker push darkjus/schedule-service:latest
cd - > /dev/null || exit 1

echo "Building and pushing template-service..."
cd $(find domains -type d -name "template-service") || exit 1
docker build -t darkjus/template-service:latest .
docker push darkjus/template-service:latest
cd - > /dev/null || exit 1

echo "Building and pushing geo-service..."
cd $(find domains -type d -name "geo-service") || exit 1
docker build -t darkjus/geo-service:latest .
docker push darkjus/geo-service:latest
cd - > /dev/null || exit 1

echo "Building and pushing validation-service..."
cd $(find domains -type d -name "validation-service") || exit 1
docker build -t darkjus/validation-service:latest .
docker push darkjus/validation-service:latest
cd - > /dev/null || exit 1

echo "Building and pushing email-service..."
cd $(find domains -type d -name "email-service") || exit 1
docker build -t darkjus/email-service:latest .
docker push darkjus/email-service:latest
cd - > /dev/null || exit 1

echo "Building and pushing sms-service..."
cd $(find domains -type d -name "sms-service") || exit 1
docker build -t darkjus/sms-service:latest .
docker push darkjus/sms-service:latest
cd - > /dev/null || exit 1

echo "Building and pushing push-service..."
cd $(find domains -type d -name "push-service") || exit 1
docker build -t darkjus/push-service:latest .
docker push darkjus/push-service:latest
cd - > /dev/null || exit 1

echo "Building and pushing logging-service..."
cd $(find domains -type d -name "logging-service") || exit 1
docker build -t darkjus/logging-service:latest .
docker push darkjus/logging-service:latest
cd - > /dev/null || exit 1

echo "Building and pushing retry-service..."
cd $(find domains -type d -name "retry-service") || exit 1
docker build -t darkjus/retry-service:latest .
docker push darkjus/retry-service:latest
cd - > /dev/null || exit 1

echo "Building and pushing broadcast-service..."
cd $(find domains -type d -name "broadcast-service") || exit 1
docker build -t darkjus/broadcast-service:latest .
docker push darkjus/broadcast-service:latest
cd - > /dev/null || exit 1

echo "Building and pushing socket-service..."
cd $(find domains -type d -name "socket-service") || exit 1
docker build -t darkjus/socket-service:latest .
docker push darkjus/socket-service:latest
cd - > /dev/null || exit 1

echo "Building and pushing channel-service..."
cd $(find domains -type d -name "channel-service") || exit 1
docker build -t darkjus/channel-service:latest .
docker push darkjus/channel-service:latest
cd - > /dev/null || exit 1

echo "Building and pushing retry-engine..."
cd $(find domains -type d -name "retry-engine") || exit 1
docker build -t darkjus/retry-engine:latest .
docker push darkjus/retry-engine:latest
cd - > /dev/null || exit 1

echo "Building and pushing notification-core..."
cd $(find domains -type d -name "notification-core") || exit 1
docker build -t darkjus/notification-core:latest .
docker push darkjus/notification-core:latest
cd - > /dev/null || exit 1

echo "Building and pushing metrics-collector..."
cd $(find domains -type d -name "metrics-collector") || exit 1
docker build -t darkjus/metrics-collector:latest .
docker push darkjus/metrics-collector:latest
cd - > /dev/null || exit 1

echo "Building and pushing report-generator..."
cd $(find domains -type d -name "report-generator") || exit 1
docker build -t darkjus/report-generator:latest .
docker push darkjus/report-generator:latest
cd - > /dev/null || exit 1

echo "Building and pushing audit-trail..."
cd $(find domains -type d -name "audit-trail") || exit 1
docker build -t darkjus/audit-trail:latest .
docker push darkjus/audit-trail:latest
cd - > /dev/null || exit 1

echo "Building and pushing feedback-service..."
cd $(find domains -type d -name "feedback-service") || exit 1
docker build -t darkjus/feedback-service:latest .
docker push darkjus/feedback-service:latest
cd - > /dev/null || exit 1

echo "Building and pushing stat-analyzer..."
cd $(find domains -type d -name "stat-analyzer") || exit 1
docker build -t darkjus/stat-analyzer:latest .
docker push darkjus/stat-analyzer:latest
cd - > /dev/null || exit 1

echo "Building and pushing graphql-gateway..."
cd $(find domains -type d -name "graphql-gateway") || exit 1
docker build -t darkjus/graphql-gateway:latest .
docker push darkjus/graphql-gateway:latest
cd - > /dev/null || exit 1

echo "Building and pushing webhook-service..."
cd $(find domains -type d -name "webhook-service") || exit 1
docker build -t darkjus/webhook-service:latest .
docker push darkjus/webhook-service:latest
cd - > /dev/null || exit 1

echo "Building and pushing soap-consumer..."
cd $(find domains -type d -name "soap-consumer") || exit 1
docker build -t darkjus/soap-consumer:latest .
docker push darkjus/soap-consumer:latest
cd - > /dev/null || exit 1

echo "Building and pushing external-push..."
cd $(find domains -type d -name "external-push") || exit 1
docker build -t darkjus/external-push:latest .
docker push darkjus/external-push:latest
cd - > /dev/null || exit 1

echo "Building and pushing channel-validator..."
cd $(find domains -type d -name "channel-validator") || exit 1
docker build -t darkjus/channel-validator:latest .
docker push darkjus/channel-validator:latest
cd - > /dev/null || exit 1

echo "All services built and pushed successfully."
