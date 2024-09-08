# PWC Task

# ✨Hosting Python application on AWS EKS✨

## Description
we are targeting to host python application on AWS EKS, and make it public accessable using kubernetes loadbalancer:
1. After hosting App on the EKS cluster, any one can access it through the DNS domain name of the loadbalancer.

 


## Requirements
- having container run time to build image
- having access to AWS
- [Installing  AWS CLI] (https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- [Installing terraform] (https://learn.hashicorp.com/tutorials/terraform/install-cli)


## Walking through
We can discuss our solution through 5 steps:

1. Create a VPC, private subnet, public subnet and NAT gateway and attach all of this togehter.
2. create ECR to push image on it.
3. create EKS and it needed policy and roles to allow it pulling image from ecr.
4. write Deployment and service file to deploy it on the EKS cluster.


## 1- Create VPC, private subnet, public subnet and NAT gateway and attach all of this togehter.
i used the official documention of terraform to help me creating the network module (https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/)
1. i used resource "aws_vpc" to create the vpc and use attribute "name" to give this vpc name
2. i used the resourse "aws_subnet" to create public and private subnets, and provide it with the vpc id so it will pull IPS from it
3. i used the resource "aws_internet_gateway" and attach it in the route table with the public subnet, so we can access it through the internet
4. i used the resource "aws_nat_gateway" and attach it in the route table with private subnets, so private subnet can access the internet

## 2- Create ECR to push image on it.
i used the official documention of terraform to help me creating the WAF (https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/)
1. i used resource "aws_ecr_repository" to create ECR repo so it will keep record of the build images, also EKS will pull image from it

## 3- Create EKS and it needed policy and roles to allow it pulling image from ecr
i used the official documention of terraform to help me creating the Lambda function (https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/)
1. i used the resource "aws_eks_cluster" to create the kubernates cluster
2. i used the resource "aws_eks_nodes" to create nodes inside the cluster and attach it to private subnet only
3. i used the resources "aws_iam_role" and "aws_iam_role_policy_attachment" to attach the needed policy for EKS cluster to work and connect to ECR 

## 4- write Deployment and service file to deploy it on the EKS cluster.
1. i wrote deployment.yaml file, that will be deployed on the EKS cluster, this file will deploy one pod and pull its image from the ECR, also expose container on port 5000
2. i wrote service.yaml file, that will be deployed on the EKS cluster, this file will create a http load balancer and map container port 5000 to be 80 so we can access it public


## configuration

1. we should specify our cloud provider in our case it will be AWS and specify the region that will work on it

2. we will connect our machine with AWS using access and secret keys with command "AWS configure"

3. I wrote scripts for terraform taht will keep tfstate file save on S3 buckets, and to do terraform (init,plan,apply) very easy, for example: cd to scripts directory and run ./init.sh

4. after deploying infrastructure, now we will push docker image to ecr, by building image first, then use docker push command

5. now we can deploy deployment.yaml and service.yaml, first we should connect to aws eks cluster then use kubectl commands.

## Testing Service
after creating every thing, we will sign in to the console and get the dns domain name for loadbalancer and access it from any browser.
or I deployed the terraform and everything is working, for testing you can use this URL: http://a8b58435ee3af401f9156b21e23b6782-212803910.us-east-1.elb.amazonaws.com/users

I will destroy infra at 6:00pm Tuesday

