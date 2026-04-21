---
name: intake-to-repo
description: Create a standardized client GitHub repository from a client onboarding folder. Use when Codex or Claude Code needs to validate client intake data, normalize client assets/content, create the client repo under the maz GitHub organization, copy files into the client-data structure, create initial logs, and produce the first commit/push.
---

# Intake to Repo

## Goal

Transform an onboarding folder into a ready-to-work client repository.

## Required Inputs

1. Intake folder path, usually `incoming/<client-id>/`.
2. GitHub owner/org, default `maz`.
3. Target repository slug, default `client-<client-id>`.

## Workflow

1. Inspect the intake folder and confirm it contains at least:
   - `client-form.json`
   - `brand/`
   - `content/`
2. Validate `client-form.json` against `references/client-form.schema.json`.
3. Create a human-readable intake report listing:
   - Valid fields.
   - Missing required files/folders.
   - Ambiguous or low-confidence data.
   - Recommended follow-up questions.
4. Create the client repository using GitHub CLI or GitHub API.
5. Apply the standard repository structure from `references/client-repo-structure.md`.
6. Copy intake files into `client-data/` without changing originals.
7. Create initial logs:
   - `logs/CHANGELOG_AI.md`
   - `logs/entries/<yyyy-mm-dd>-initial-intake.md`
8. Commit and push with message `Initialize client repository from intake`.
9. Return the repo URL, validation summary, and unresolved blockers.

## Operating Rules

1. Never invent missing client facts. Mark them as pending in the intake report.
2. Never commit secrets, API keys, credentials, private documents not intended for the site, or raw payment data.
3. Preserve original asset filenames where practical. If renaming is needed, record the mapping in the intake log.
4. Prefer a private GitHub repository until the client is approved for public exposure.
5. Use one initial commit for the generated structure and copied intake data.

## Scripts

Use `scripts/validate_intake.ps1` to perform a local folder validation before creating the GitHub repository.

## References

Read only the needed reference file:
1. `references/client-form.schema.json` for required form fields.
2. `references/client-repo-structure.md` for the target repository layout.
3. `references/log-template.md` for human-readable AI logs.
