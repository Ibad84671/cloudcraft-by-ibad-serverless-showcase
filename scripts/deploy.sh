#!/usr/bin/env bash
set -euo pipefail
STACK_NAME="${STACK_NAME:-cloudcraft-demo}"
REGION="${AWS_REGION:-us-east-1}"
TEMPLATE="infrastructure/cloudformation/template.yaml"
ENVIRONMENT="${ENVIRONMENT_NAME:-demo}"
command -v aws >/dev/null || { echo 'AWS CLI is required.'; exit 1; }
aws sts get-caller-identity >/dev/null || { echo 'AWS credentials are not configured.'; exit 1; }
echo '==> Validating CloudFormation'
aws cloudformation validate-template --template-body "file://$TEMPLATE" --region "$REGION" >/dev/null
echo '==> Deploying infrastructure'
aws cloudformation deploy --template-file "$TEMPLATE" --stack-name "$STACK_NAME" --region "$REGION" --parameter-overrides EnvironmentName="$ENVIRONMENT" --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM
echo '==> Uploading frontend'
BUCKET=$(aws cloudformation describe-stacks --stack-name "$STACK_NAME" --region "$REGION" --query 'Stacks[0].Outputs[?OutputKey==`WebsiteBucketName`].OutputValue' --output text)
aws s3 sync src/ "s3://$BUCKET/" --delete --region "$REGION"
DIST=$(aws cloudformation describe-stacks --stack-name "$STACK_NAME" --region "$REGION" --query 'Stacks[0].Outputs[?OutputKey==`CloudFrontUrl`].OutputValue' --output text)
API=$(aws cloudformation describe-stacks --stack-name "$STACK_NAME" --region "$REGION" --query 'Stacks[0].Outputs[?OutputKey==`ApiUrl`].OutputValue' --output text)
ID=$(aws cloudformation describe-stack-resources --stack-name "$STACK_NAME" --region "$REGION" --query 'StackResources[?LogicalResourceId==`CloudFrontDistribution`].PhysicalResourceId' --output text)
aws cloudfront create-invalidation --distribution-id "$ID" --paths '/*' >/dev/null
echo
echo "Frontend: $DIST"
echo "API:      $API"
echo 'Deployment complete.'
