$ErrorActionPreference = 'Stop'
$StackName = if ($env:STACK_NAME) { $env:STACK_NAME } else { 'cloudcraft-demo' }
$Region = if ($env:AWS_REGION) { $env:AWS_REGION } else { 'us-east-1' }
$Environment = if ($env:ENVIRONMENT_NAME) { $env:ENVIRONMENT_NAME } else { 'demo' }
$template = 'infrastructure/cloudformation/template.yaml'
aws sts get-caller-identity | Out-Null
aws cloudformation validate-template --template-body "file://$template" --region $Region | Out-Null
aws cloudformation deploy --template-file $template --stack-name $StackName --region $Region --parameter-overrides "EnvironmentName=$Environment" --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM
$bucket = aws cloudformation describe-stacks --stack-name $StackName --region $Region --query "Stacks[0].Outputs[?OutputKey=='WebsiteBucketName'].OutputValue" --output text
aws s3 sync src/ "s3://$bucket/" --delete --region $Region
$dist = aws cloudformation describe-stacks --stack-name $StackName --region $Region --query "Stacks[0].Outputs[?OutputKey=='CloudFrontUrl'].OutputValue" --output text
$api = aws cloudformation describe-stacks --stack-name $StackName --region $Region --query "Stacks[0].Outputs[?OutputKey=='ApiUrl'].OutputValue" --output text
Write-Host "Frontend: $dist"
Write-Host "API:      $api"
