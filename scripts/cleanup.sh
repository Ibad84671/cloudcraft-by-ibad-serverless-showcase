#!/bin/bash
echo "🧹 Destroying CloudCraft..."
cd infrastructure
terraform destroy -auto-approve
echo "✅ Cleanup complete!"