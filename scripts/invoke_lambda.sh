#!/usr/bin/env bash
TARGET=$1
aws lambda update-function-code --function-name ${TARGET} --zip-file fileb://${TARGET}.zip
aws lambda invoke --function-name $TARGET response.json
cat response.json
rm response.json