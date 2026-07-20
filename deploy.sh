#!/bin/bash

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 029247419664.dkr.ecr.us-east-1.amazonaws.com

docker pull 029247419664.dkr.ecr.us-east-1.amazonaws.com/codealpha-devops-project:latest

docker stop codealpha-web || true

docker rm codealpha-web || true

docker run -d -p 80:80 --name codealpha-web 029247419664.dkr.ecr.us-east-1.amazonaws.com/codealpha-devops-project:latest
