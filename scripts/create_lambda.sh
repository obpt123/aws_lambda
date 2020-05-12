#!/usr/bin/env bash

aws cloudformation package --template-file template.json --s3-bucket ypbbucket --output-template-file template.packaged
aws cloudformation deploy --template-file template.packaged --stack-name ypbstack