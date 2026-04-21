# Vercel Deploy Contract

Required environment for the central Maz Vercel account:
1. `VERCEL_TOKEN`
2. `VERCEL_TEAM_ID` when using a team account
3. `VERCEL_ORG_ID` and `VERCEL_PROJECT_ID` when deploying an existing project

Preferred CLI flow:

```powershell
vercel pull --yes --environment=preview --token $env:VERCEL_TOKEN
vercel build --token $env:VERCEL_TOKEN
vercel deploy --prebuilt --token $env:VERCEL_TOKEN
```

Production promotion:

```powershell
vercel deploy --prebuilt --prod --token $env:VERCEL_TOKEN
```

Rules:
1. Use preview deploys by default.
2. Promote to production only when local checks pass and Lucas approves.
3. Record the deployment URL in the AI log.
4. Record any missing env vars or failed Vercel steps as blockers.
