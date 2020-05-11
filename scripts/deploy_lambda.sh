#!/usr/bin/env bash
TARGET=$1
zip -q  -r "${TARGET}.zip" . -x scripts/* -x node_modules/
aws lambda update-function-code --function-name ${TARGET} --zip-file fileb://${TARGET}.zip
rm "${TARGET}.zip"