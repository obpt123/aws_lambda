#!/usr/bin/env bash
TARGET=$1
aws lambda invoke --function-name $TARGET response.json
cat response.json
rm response.json