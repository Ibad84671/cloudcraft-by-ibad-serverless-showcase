$ErrorActionPreference = 'Stop'
$StackName = if ($env:STACK_NAME) { $env:STACK_NAME } else { 'cloudcraft-demo' }
$Region = if ($env:AWS_REGION) { $env:AWS_REGION } else { 'us-east-1' }
$confirm = Read-Host "Type DELETE to remove stack '$StackName'"
if ($confirm -ne 'DELETE') { Write-Host 'Cancelled.'; exit 0 }
aws cloudformation delete-stack --stack-name $StackName --region $Region
aws cloudformation wait stack-delete-complete --stack-name $StackName --region $Region
Write-Host 'Stack deleted.'
