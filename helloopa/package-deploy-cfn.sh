#!/bin/bash
# 'package-deploy-cfn.sh' Automates the process to build and deploy a container to ECR.
# Run the following script ./package-deploy-cfn.sh with your AWS Region, S3 bucket name, root stack name, and the name of the environment you want to deploy resources into.
# EXAMPLE: ./package-deploy-cfn.sh us-east-1 helloopa-root my-bucket my-stack my-env(Existing Instance Name or VPC name?)
# Make sure to modify the script with the parameters you want to use for VpcCIDR, PublicCIDRA(subneta), and PublicCIDRB(subnetb) under --parameter-overrides
if [ $# -eq 0 ]; then
   echo "No arguments supplied"
   echo "Usage:<script name> region bucket_name stack_name environment"
   exit 1
fi
declare -r Region=$1
declare -r S3BucketName=$2
declare -r StackName=$3
declare -r EnvironmentName=$4
# This command will create a packaged CloudFormation template, uploads any nested stacks to given S3 Bucket.
aws cloudformation package --region ${Region} --template-file ./templates/helloopa-root.yml --output-template ./templates/packed-helloopa-root.yml --s3-bucket ${S3BucketName}

# This command will deploy your packed CloudFormation template
#aws cloudformation deploy --region ${Region} --template-file templates/packed-helloopa-root.yml --stack-name ${StackName} --capabilities CAPABILITY_AUTO_EXPAND CAPABILITY_NAMED_IAM CAPABILITY_IAM --parameter-overrides EnvironmentName=${EnvironmentName} VpcCIDR=172.31.0.0/16 PublicCIDRA=172.31.80.0/20 PublicCIDRB=172.31.16.0/20
aws cloudformation deploy --region ${Region} --template-file templates/packed-helloopa-root.yml --stack-name ${StackName} --capabilities CAPABILITY_AUTO_EXPAND CAPABILITY_NAMED_IAM CAPABILITY_IAM --parameter-overrides EnvironmentName=${EnvironmentName} VpcCIDR=10.10.0.0/16 PublicCIDRA=10.10.10.0/24 PublicCIDRB=10.10.11.0/24 
exit 0;