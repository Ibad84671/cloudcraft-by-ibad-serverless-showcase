# ☁️ CloudCraft by Ibad – Serverless AWS Showcase

[![CI](https://github.com/Ibad84671/cloudcraft-by-ibad-serverless-showcase/actions/workflows/ci.yml/badge.svg)](https://github.com/Ibad84671/cloudcraft-by-ibad-serverless-showcase/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![AWS](https://img.shields.io/badge/Cloud-AWS-orange?logo=amazon-aws)](https://aws.amazon.com/)

**CloudCraft** is a serverless AWS showcase built with Terraform. It demonstrates:
- Infrastructure as Code (Terraform)
- S3 static website hosting
- CloudFront CDN with OAI
- AWS Lambda (Node.js) functions
- CI/CD with GitHub Actions
- Security scanning (Checkov)

## Architecture (Current)

*Future: API Gateway → Lambda → DynamoDB*

## Repository Structure

cloudcraft-by-ibad-serverless-showcase/
├── .github/workflows/ci.yml # CI pipeline
├── infrastructure/ # Terraform IaC
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
├── src/
│ ├── index.html # Static website
│ └── lambda/ # Lambda functions
│ ├── get-items.js
│ └── put-items.js
├── tests/ # Unit tests
├── docs/ # Documentation
├── scripts/ # Deploy/cleanup scripts
├── README.md
├── LICENSE
├── SECURITY.md
└── CONTRIBUTING.md

text

## Quick Start
1. Clone: `git clone https://github.com/Ibad84671/cloudcraft-by-ibad-serverless-showcase.git`
2. Deploy: `cd infrastructure && terraform init && terraform apply`
3. Get CloudFront URL from outputs.

## CI/CD Pipeline
- On every push to `main`:
  - `terraform fmt -check`
  - `terraform validate`
  - Checkov security scan

## Security
- S3 bucket: Block public access
- CloudFront: OAI, HTTPS only
- .gitignore: Prevents secrets
- Checkov: IaC security scanning

## Cost Estimate (demo)
- S3: < $1/month
- CloudFront: Free tier (1TB/month)
- Lambda: Free tier (1M requests/month)
- **Total**: ~$0–$5/month

## Future Improvements
- API Gateway + Lambda integration
- DynamoDB persistence
- IAM least-privilege policies
- CloudWatch alarms & dashboards

## License
MIT © Ibad Shaikh
