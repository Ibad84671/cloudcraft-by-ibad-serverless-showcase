#!/usr/bin/env bash
set -euo pipefail
STACK_NAME="${STACK_NAME:-cloudcraft-demo}"
REGION="${AWS_REGION:-us-east-1}"
read -r -p "Type DELETE to remove stack '$STACK_NAME': " CONFIRM
[[ "$CONFIRM" == "DELETE" ]] || { echo 'Cancelled.'; exit 0; }
aws cloudformation delete-stack --stack-name "$STACK_NAME" --region "$REGION"
aws cloudformation wait stack-delete-complete --stack-name "$STACK_NAME" --region "$REGION"
echo 'Stack deleted.'
