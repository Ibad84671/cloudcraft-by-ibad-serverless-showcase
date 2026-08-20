# Security

CloudCraft is designed as a small reference architecture, not as a claim of production certification.

## Controls

- S3 Block Public Access is enabled.
- CloudFront reads the S3 origin through an Origin Access Identity.
- S3 and DynamoDB use server-side encryption.
- DynamoDB point-in-time recovery is enabled.
- Lambda permissions are limited to the application table and CloudWatch log streams.
- API input is validated before persistence.
- Client responses avoid exposing internal exception details.
- No AWS credentials are required by the browser.
- CI has `contents: read` and performs IaC security scanning.

## CORS

The template exposes `AllowedOrigin` because the API is consumed by the static frontend. The default `*` is convenient for a demo but should be replaced with the exact CloudFront origin for a production deployment.

## Threat-model boundaries

The showcase does not include authentication, WAF, custom domains, or private networking because they are not required by the current product purpose. Those controls should be added if CloudCraft evolves into a multi-user or internet-facing production application.
