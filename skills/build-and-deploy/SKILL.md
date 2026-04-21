---
name: build-and-deploy
description: Build, update, test, and deploy a client website from a standardized maz client repository. Use when Codex or Claude Code needs to read client-data, generate or modify the site project, run checks, deploy through the Vercel API/CLI, record human-readable logs, and report the production or preview URL.
---

# Build and Deploy

## Goal

Turn a standardized client repository into a working website deployment and keep future changes traceable.

## Required Inputs

1. Client repository path.
2. Central Maz Vercel team/account context.
3. Deployment target: `preview` or `production`.
4. Requested change, if this is not the first build.

## Workflow

1. Read `client-data/client-form.json`, `client-data/brand/`, `client-data/content/`, and available assets.
2. Inspect current `site/` implementation before editing.
3. Build or update the website incrementally.
4. Run local checks:
   - install dependencies if needed,
   - lint,
   - tests when present,
   - production build.
5. Deploy with Vercel CLI or API using the rules in `references/vercel-deploy-contract.md`.
6. Create a log entry in `logs/entries/<yyyy-mm-dd>-<change-slug>.md`.
7. Update `logs/CHANGELOG_AI.md`.
8. Return deployment URL, checks performed, and any unresolved risks.

## Operating Rules

1. Preserve the existing site stack unless there is no implementation yet.
2. For a new MVP site, prefer Next.js because it maps cleanly to Vercel.
3. Do not overwrite client source data in `client-data/`; propose corrections separately.
4. Use preview deployments for substantial changes before production.
5. Do not deploy to production or configure custom domains without Lucas approval.
6. Log every AI-made code/content/design change in human language.

## Site Type Selection

For first builds, choose the site type from the client data and explain the choice in the log:
1. `institutional-simple` for companies that need credibility, service overview, and contact.
2. `landing-page` for one offer, campaign, lead capture, or paid traffic.
3. `catalog` for multiple products/services that need browsing and comparison.
4. `custom` when another format is clearly better for the client goal.

## Model Policy

1. Use Opus for architecture, site generation, debugging, and deployment failures.
2. Use a cheaper model only for narrow copy/content edits after the implementation is stable.

## Scripts

Use `scripts/preflight.ps1` before deploy to check expected folders and dependency files.

## References

Read only the needed reference file:
1. `references/vercel-deploy-contract.md` for Vercel requirements.
2. `references/site-build-checklist.md` for implementation checks.
3. `references/log-template.md` for change logs.
