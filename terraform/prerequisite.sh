#!/bin/bash
BUCKETNAME="872132143780-tfstate-bucket"
REGION="ap-southeast-1"
DDBTABLENAME="tfstate-table"
PROJECT_NAME="webgoat"
#Create S3 bucket to store tfstate file with versioning enbaled.
aws s3api create-bucket --bucket $PROJECT_NAME-$REGION-$BUCKETNAME --region $REGION --create-bucket-configuration LocationConstraint=$REGION
aws s3api put-bucket-versioning --bucket $PROJECT_NAME-$REGION-$BUCKETNAME --versioning-configuration Status=Enabled

aws dynamodb create-table --table-name $PROJECT_NAME-$REGION-$DDBTABLENAME --attribute-definitions AttributeName=LockID,AttributeType=S --key-schema AttributeName=LockID,KeyType=HASH --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 --region $REGION 