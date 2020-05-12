#!/usr/bin/env bash
STACKNAME=$1
aws cloudformation delete-stack --stack-name $STACKNAME