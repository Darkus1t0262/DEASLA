#!/bin/bash
echo "Building and pushing Docker images for domain: core" 
echo "Processing user-service..."
cd $(find domains -type d -name "user-service") || exit 1
docker build -t darkjus/user-service:latest .
docker push darkjus/user-service:latest
cd - > /dev/null || exit 1

echo "Processing auth-service..."
cd $(find domains -type d -name "auth-service") || exit 1
docker build -t darkjus/auth-service:latest .
docker push darkjus/auth-service:latest
cd - > /dev/null || exit 1

echo "Processing role-service..."
cd $(find domains -type d -name "role-service") || exit 1
docker build -t darkjus/role-service:latest .
docker push darkjus/role-service:latest
cd - > /dev/null || exit 1

echo "Processing profile-service..."
cd $(find domains -type d -name "profile-service") || exit 1
docker build -t darkjus/profile-service:latest .
docker push darkjus/profile-service:latest
cd - > /dev/null || exit 1

echo "Processing language-service..."
cd $(find domains -type d -name "language-service") || exit 1
docker build -t darkjus/language-service:latest .
docker push darkjus/language-service:latest
cd - > /dev/null || exit 1

echo "Finished building all core services."
