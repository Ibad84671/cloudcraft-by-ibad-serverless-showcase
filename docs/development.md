# Development

CloudCraft intentionally keeps the frontend dependency-light. The interactive experience is a single HTML document using CSS design tokens and vanilla JavaScript.

## Local UI

Open `src/index.html` directly in a browser. Simulation mode requires no AWS account and makes no AWS API calls.

## Lambda code

The reference handlers live under `src/lambda/`. The deployable template currently uses equivalent inline Lambda code so CloudFormation can create the stack without a packaging bucket. Keep the two implementations synchronized when changing backend behavior.

## Checks

```bash
node --check src/lambda/get-items.js
node --check src/lambda/put-items.js
```

For infrastructure validation use `./scripts/validate.sh` or the CI workflow.

## Design principles

1. Simulation must be clearly labelled.
2. Live AWS behavior must have a real API call behind it.
3. CloudFormation is the infrastructure source of truth.
4. Prefer least privilege and explicit configuration.
5. Preserve responsive and reduced-motion behavior.
6. Keep the project understandable to a cloud-engineering reviewer.
