# CloudCraft Architecture

## Current Implementation
- **S3**: Static website hosting
- **CloudFront**: CDN with SSL/TLS
- **Lambda**: Two functions (get-items, put-items)
- **CI/CD**: GitHub Actions with Terraform validation & Checkov

## Planned / Future
- API Gateway integration
- DynamoDB persistent storage
- IAM least privilege policies
- CloudWatch alarms

## Flow
User → CloudFront → S3 (frontend)  
(Future: API Gateway → Lambda → DynamoDB)