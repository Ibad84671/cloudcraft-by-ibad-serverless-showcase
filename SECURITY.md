# Security Policy

## Supported Versions
| Version | Supported |
|---------|-----------|
| 1.x     | ✅ |

## Reporting a Vulnerability
If you discover a security vulnerability, please email `ibad84671@gmail.com`.  
Do **not** create a public GitHub issue.

## Security Controls
- Terraform state: Not committed (`.gitignore`)
- Secrets: Excluded via `.gitignore`
- S3: Block public access
- CloudFront: HTTPS enforced
- CI: Checkov security scan