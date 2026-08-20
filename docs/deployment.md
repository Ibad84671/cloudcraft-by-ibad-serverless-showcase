# Deployment

## 1. Authenticate

Configure the AWS CLI with an identity allowed to create the resources in `infrastructure/cloudformation/template.yaml`.

```bash
aws sts get-caller-identity
```

## 2. Validate

```bash
./scripts/validate.sh
```

## 3. Deploy

```bash
./scripts/deploy.sh
```

Windows:

```powershell
.\scripts\deploy.ps1
```

The script validates the template, deploys the CloudFormation stack, uploads `src/` to the private S3 bucket, invalidates CloudFront, and prints the resulting URLs.

## Configuration

Environment variables supported by the scripts:

- `STACK_NAME` — default `cloudcraft-demo`
- `AWS_REGION` — default `us-east-1`
- `ENVIRONMENT_NAME` — default `demo`

CloudFormation parameters:

- `ProjectName`
- `EnvironmentName`
- `AllowedOrigin`

For production, replace the default `AllowedOrigin=*` with the exact frontend origin.

## Cleanup

The cleanup helper asks for an explicit `DELETE` confirmation.

```bash
./scripts/cleanup.sh
```

PowerShell:

```powershell
.\scripts\destroy.ps1
```

## Outputs

CloudFormation returns `CloudFrontUrl`, `WebsiteBucketName`, `ApiUrl`, and `ItemsTableName`. Configure `ApiUrl` in the frontend's Live API field to exercise the real API.
