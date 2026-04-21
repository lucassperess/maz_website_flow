param(
  [string]$RepoPath = "."
)

$ErrorActionPreference = "Stop"

$requiredPaths = @(
  "client-data",
  "client-data/client-form.json",
  "site",
  "logs",
  "logs/entries"
)

$missing = @()
foreach ($relativePath in $requiredPaths) {
  $fullPath = Join-Path $RepoPath $relativePath
  if (-not (Test-Path -LiteralPath $fullPath)) {
    $missing += $relativePath
  }
}

if ($missing.Count -gt 0) {
  Write-Output "Missing required repository paths:"
  $missing | ForEach-Object { Write-Output "- $_" }
  exit 2
}

$packagePath = Join-Path $RepoPath "site/package.json"
if (-not (Test-Path -LiteralPath $packagePath)) {
  Write-Output "Warning: site/package.json not found. New site scaffolding may still be required."
}

Write-Output "Deployment preflight completed for: $RepoPath"
