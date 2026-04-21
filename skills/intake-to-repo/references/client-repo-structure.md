# Client Repository Structure

Create this layout for every client repository:

```txt
site/
  app/
  public/
  package.json
client-data/
  client-form.json
  brand/
  content/
  assets/
  legal/
logs/
  CHANGELOG_AI.md
  entries/
docs/
  runbook.md
.github/
  workflows/
    ci.yml
    weekly-review.yml
```

Rules:
1. `site/` contains only code needed to build and deploy the website.
2. `client-data/` contains normalized source data from the client intake.
3. `logs/` contains human-readable operational memory.
4. `docs/runbook.md` contains client-specific operational notes.
5. `.github/workflows/` contains automation for CI and review.
