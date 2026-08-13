#!/bin/bash
echo "🚀 Deploying CloudCraft..."
cd infrastructure
terraform init
terraform plan
terraform apply -auto-approve
echo "✅ Deployment complete!"