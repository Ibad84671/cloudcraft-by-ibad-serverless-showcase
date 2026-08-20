#!/usr/bin/env bash
set -euo pipefail
command -v aws >/dev/null || { echo 'AWS CLI is required.'; exit 1; }
aws cloudformation validate-template --template-body file://infrastructure/cloudformation/template.yaml >/dev/null
echo 'CloudFormation template is valid.'
