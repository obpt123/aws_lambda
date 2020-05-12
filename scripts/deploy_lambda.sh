#!/usr/bin/env bash
FUNCTION_NAME=$1
zip -q  -r "${FUNCTION_NAME}.zip" index.js
echo "zip file '${FUNCTION_NAME}.zip' success."

aws lambda create-function \
    --function-name ${FUNCTION_NAME} \
    --zip-file fileb://${FUNCTION_NAME}.zip \
    --role "arn:aws:iam::494526681395:role/for-aws-training-2" \
    --runtime nodejs12.x \
    --handler index.handler \
    --timeout 150

aws lambda update-function-code \
    --function-name ${FUNCTION_NAME} \
    --zip-file fileb://${FUNCTION_NAME}.zip
rm "${FUNCTION_NAME}.zip"