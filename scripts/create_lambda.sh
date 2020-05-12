#!/usr/bin/env bash
STACKNAME=$1
aws cloudformation package --template-file template.json --s3-bucket ypbbucket --output-template-file template.packaged
aws cloudformation deploy --template-file template.packaged --stack-name $STACKNAME
rm template.packaged