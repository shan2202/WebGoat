#!/bin/bash

echo "#########################################################"
echo "#     Terraform Initialization for scb-dev     #"
echo "#########################################################"
echo ""

BUCKETNAME="872132143780-tfstate-bucket"
REGION="ap-southeast-1"
DDBTABLENAME="tfstate-table"
PROJECT_NAME="webgoat"

terraform init -upgrade -reconfigure -backend=true -backend-config="bucket=$PROJECT_NAME-$REGION-$BUCKETNAME" -backend-config="key=$PROJECT_NAME/terraform.tfstate" -backend-config="region=$REGION" -backend-config="dynamodb_table=$PROJECT_NAME-$REGION-$DDBTABLENAME"
terraform workspace select -or-create dev