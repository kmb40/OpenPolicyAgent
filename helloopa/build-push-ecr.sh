#!/bin/bash
# 'build-push-ecr.sh' Automates the process to build and deploy a container to ECR.
# USAGE EXAMPLE: ./build-push-ecr.sh 123456789101 us-east-1 opa-service
if [ $# -eq 0 ]; then
   echo "No arguments supplied"
   echo "Usage:<script name> accountid, region, repo"
   exit 1
fi
declare -r AccountID=$1
declare -r Region=$2
declare -r Repo=$3

# Create an ECR Repository for your service, if one doesn't already exist.
out=$(aws ecr create-repository --region ${Region} --repository-name ${Repo} --image-scanning-configuration scanOnPush=true)
RepoURI=${AccountID}.dkr.ecr.${Region}.amazonaws.com/${Repo}
Registry=${AccountID}.dkr.ecr.${Region}.amazonaws.com/

# Authenticate with ECR for the specified registry. Make sure Docker Client is running on your local machine
aws ecr get-login-password | docker login --username AWS --password-stdin $Registry

# Build your Docker container image locally
cd ./${Repo}
docker build --platform linux/amd64 -t ${Repo}:latest .

# Tag your Docker Image for ECR
docker tag ${Repo}:latest ${RepoURI}:latest

# Push your Docker Image to ECR
docker push ${RepoURI}:latest
exit 0;