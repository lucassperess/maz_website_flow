param(
  [Parameter(Mandatory = $true)]
  [string]$Path
)

$ErrorActionPreference = "Stop"

$requiredPaths = @(
  "client-form.json",
  "brand",
  "content"
)

if (-not (Test-Path -LiteralPath $Path)) {
  throw "Intake folder not found: $Path"
}

$missing = @()
foreach ($relativePath in $requiredPaths) {
  $fullPath = Join-Path $Path $relativePath
  if (-not (Test-Path -LiteralPath $fullPath)) {
    $missing += $relativePath
  }
}

$formPath = Join-Path $Path "client-form.json"
if (Test-Path -LiteralPath $formPath) {
  try {
    Get-Content -Raw -LiteralPath $formPath | ConvertFrom-Json | Out-Null
  } catch {
    throw "client-form.json is not valid JSON: $($_.Exception.Message)"
  }
}

if ($missing.Count -gt 0) {
  Write-Output "Missing required intake paths:"
  $missing | ForEach-Object { Write-Output "- $_" }
  exit 2
}

Write-Output "Intake folder passed basic validation: $Path"
