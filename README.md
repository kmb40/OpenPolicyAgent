This repo contains various Open Policy Agent research and development projects.

## helloopa
Objective - Design a solution that verifies users permission to access microservices.

Tools - 
* VSCode
  * VSCode SSH Extension
* AWS CLI
* Docker

Dependicies - 
* Axios JS - library for making http request from browser and node environments.
* express JS - framework for building web apps.

Services - 
* Open Policy Agent (OPA)
* Amazon Elastic Container Service (ECS)
* Amazon Elastic Container Registry (ECR)

Execution - 
1. Setup
2. Setup and configure an EC2 instance

Reference - https://aws.amazon.com/blogs/opensource/deploying-open-policy-agent-opa-as-a-sidecar-on-amazon-elastic-container-service-amazon-ecs/ 

### 10.7.25
### Note: Steps to use when the infratrucure has already be setup.
If AWS ClI isnt installed, see - https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

1. Primary container (web service)
Build and push the helloopa-service container. To do this, run the script we’ve created in your terminal by entering ./build-push-ecr.sh [AccountID] [AWSRegion] helloopa-service. E.g. ./build-push-ecr.sh 73473210**** us-east-1 helloopa-service

2.Sidecar container (OPA service)
Build and push the opa-service container. To do this, run the script we’ve created in your terminal by entering ./build-push-ecr.sh [AccountID] [AWSRegion] opa-service.