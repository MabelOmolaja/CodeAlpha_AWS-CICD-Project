#!/bin/bash

set -e

echo "Logging into Amazon ECR..."

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 029247419664.dkr.ecr.us-east-1.amazonaws.com


echo "Pulling latest Docker image..."

docker pull 029247419664.dkr.ecr.us-east-1.amazonaws.com/codealpha-devops-project:latest


echo "Stopping old container..."

docker stop codealpha-web || true


echo "Removing old container..."

docker rm codealpha-web || true


echo "Starting new container..."

docker run -d \
--name codealpha-web \
-p 80:80 \
029247419664.dkr.ecr.us-east-1.amazonaws.com/codealpha-devops-project:latest


echo "Checking container status..."

docker ps


echo "Deployment completed successfully!"
