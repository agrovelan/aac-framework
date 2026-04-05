param(
  [Parameter(Mandatory = $true)]
  [string]$DocType,

  [string]$Title = "",

  [string]$Slug = "",
  [string]$CloudScope = "",
  [string]$Version = "",

  [string]$OutputDir = "docs",
  [string]$Status = "Draft",
  [string]$Owner = ""
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$registryPath = Join-Path $repoRoot "doctypes/registry.yaml"
$namingConventionsPath = Join-Path $repoRoot "naming/naming-conventions.yaml"

function Get-FileText {
  param([string]$Path)

  if (-not (Test-Path -LiteralPath $Path)) {
    throw "Missing file: $Path"
  }

  return Get-Content -LiteralPath $Path -Raw
}

function Convert-ToSlug {
  param([string]$Value)

  $slug = $Value.ToLowerInvariant()
  $slug = [regex]::Replace($slug, "[^a-z0-9]+", "-")
  $slug = [regex]::Replace($slug, "-+", "-")
  $slug = $slug.Trim("-")

  if ([string]::IsNullOrWhiteSpace($slug)) {
    throw "Could not generate a slug from title '$Value'."
  }

  return $slug
}

function Parse-DoctypeBlock {
  param(
    [string[]]$Lines,
    [string]$Id
  )

  for ($i = 0; $i -lt $Lines.Count; $i++) {
    if ($Lines[$i] -match "^\s{2}-\s+id:\s*$([regex]::Escape($Id))\s*$") {
      $template = ""
      $namingPattern = ""
      $abbreviation = ""

      for ($j = $i + 1; $j -lt $Lines.Count; $j++) {
        if ($Lines[$j] -match "^\s{2}-\s+id:\s*") {
          break
        }

        if ($Lines[$j] -match "^\s{4}template:\s*([^\r\n#]+)") {
          $template = $matches[1].Trim()
        }

        if ($Lines[$j] -match '^\s{4}naming_pattern:\s*"([^"]+)"') {
          $namingPattern = $matches[1].Trim()
        }

        if ([string]::IsNullOrWhiteSpace($namingPattern) -and $Lines[$j] -match '^\s{4}naming_pattern:\s*([^\r\n#]+)') {
          $namingPattern = $matches[1].Trim()
        }

        if ($Lines[$j] -match '^\s{4}abbreviation:\s*([^\r\n#]+)') {
          $abbreviation = $matches[1].Trim()
        }
      }

      if ([string]::IsNullOrWhiteSpace($template)) {
        throw "Doctype '$Id' is missing template in doctypes/registry.yaml."
      }

      if ([string]::IsNullOrWhiteSpace($namingPattern)) {
        throw "Doctype '$Id' is missing naming_pattern in doctypes/registry.yaml."
      }

      return @{
        id            = $Id
        template      = $template
        namingPattern = $namingPattern
        abbreviation  = $abbreviation
      }
    }
  }

  return $null
}

function Get-AvailableDoctypes {
  param([string]$RegistryText)

  $ids = [System.Collections.Generic.List[string]]::new()
  foreach ($m in [regex]::Matches($RegistryText, "(?m)^\s{2}-\s+id:\s*([a-z0-9-]+)\s*$")) {
    $ids.Add($m.Groups[1].Value)
  }

  return $ids
}

function Get-NamingPatternFromConventions {
  param(
    [string[]]$Lines,
    [string]$Id
  )

  $inPatterns = $false
  $inTarget = $false

  for ($i = 0; $i -lt $Lines.Count; $i++) {
    $line = $Lines[$i]

    if (-not $inPatterns) {
      if ($line -match '^\s{2}patterns:\s*$') {
        $inPatterns = $true
      }
      continue
    }

    if ($line -match '^\S') {
      break
    }

    if ($line -match "^\s{4}$([regex]::Escape($Id)):\s*$") {
      $inTarget = $true
      continue
    }

    if ($inTarget -and $line -match '^\s{4}[a-z0-9-]+:\s*$') {
      break
    }

    if ($inTarget -and $line -match '^\s{6}pattern:\s*"([^"]+)"') {
      return $matches[1].Trim()
    }

    if ($inTarget -and $line -match '^\s{6}pattern:\s*([^\r\n#]+)') {
      return $matches[1].Trim()
    }
  }

  return $null
}

function Get-NextSequence {
  param(
    [string]$Directory,
    [string]$Prefix
  )

  if (-not (Test-Path -LiteralPath $Directory)) {
    return "0001"
  }

  $max = 0
  $regex = "^" + [regex]::Escape($Prefix) + "(\d{4})-"

  Get-ChildItem -LiteralPath $Directory -File -Filter *.md | ForEach-Object {
    if ($_.Name -match $regex) {
      $current = [int]$matches[1]
      if ($current -gt $max) {
        $max = $current
      }
    }
  }

  return ("{0:D4}" -f ($max + 1))
}

$registryText = Get-FileText -Path $registryPath
$registryLines = $registryText -split "`r?`n"
$namingConventionsText = Get-FileText -Path $namingConventionsPath
$namingConventionsLines = $namingConventionsText -split "`r?`n"

$doctypeDef = Parse-DoctypeBlock -Lines $registryLines -Id $DocType
if ($null -eq $doctypeDef) {
  $available = (Get-AvailableDoctypes -RegistryText $registryText) -join ", "
  throw "Unknown doctype '$DocType'. Available values: $available"
}

if ($doctypeDef -is [array]) {
  $doctypeDef = $doctypeDef | Where-Object { $_ -is [hashtable] } | Select-Object -First 1
}

if ($null -eq $doctypeDef -or -not ($doctypeDef -is [hashtable])) {
  throw "Failed to parse doctype '$DocType' from doctypes/registry.yaml."
}

$namingPattern = Get-NamingPatternFromConventions -Lines $namingConventionsLines -Id $DocType
if ([string]::IsNullOrWhiteSpace($namingPattern)) {
  throw "Doctype '$DocType' is missing a file pattern in naming/naming-conventions.yaml."
}

# Normalize alternate sequence token notation.
$namingPattern = $namingPattern.Replace("{####}", "{NNNN}")

$resolvedPattern = $namingPattern

if ($resolvedPattern.Contains("{doctype}")) {
  $abbreviation = ([string]$doctypeDef["abbreviation"]).ToLowerInvariant()
  if ([string]::IsNullOrWhiteSpace($abbreviation)) {
    throw "Doctype '$DocType' has no abbreviation in doctypes/registry.yaml but naming pattern requires {doctype}."
  }
  $resolvedPattern = $resolvedPattern.Replace("{doctype}", $abbreviation)
}

if ($resolvedPattern.Contains("{cloud-scope}")) {
  if ([string]::IsNullOrWhiteSpace($CloudScope)) {
    throw "Doctype '$DocType' requires -CloudScope because its naming pattern includes {cloud-scope}."
  }

  $normalizedCloudScope = $CloudScope.ToLowerInvariant()
  if ($normalizedCloudScope -notin @("azr", "gcp")) {
    throw "Invalid -CloudScope '$CloudScope'. Allowed values: azr, gcp."
  }

  $resolvedPattern = $resolvedPattern.Replace("{cloud-scope}", $normalizedCloudScope)
}

if ($resolvedPattern.Contains("{version}")) {
  if ([string]::IsNullOrWhiteSpace($Version)) {
    throw "Doctype '$DocType' requires -Version because its naming pattern includes {version}."
  }

  $resolvedPattern = $resolvedPattern.Replace("{version}", $Version.ToLowerInvariant())
}

$resolvedSlug = ""
if ($resolvedPattern.Contains("{slug}")) {
  if ([string]::IsNullOrWhiteSpace($Slug)) {
    throw "Doctype '$DocType' requires -Slug because its naming pattern includes {slug}."
  }

  $resolvedSlug = Convert-ToSlug -Value $Slug
  $resolvedPattern = $resolvedPattern.Replace("{slug}", $resolvedSlug)
}

$sequence = ""

if ($resolvedPattern.Contains("{NNNN}") -or $resolvedPattern.Contains("{number}")) {
  $prefixTemplate = $resolvedPattern
  $prefixTemplate = $prefixTemplate.Replace("{NNNN}", "")
  $prefixTemplate = $prefixTemplate.Replace("{number}", "")
  $prefixTemplate = $prefixTemplate.Replace("{slug}", "")
  $prefixTemplate = $prefixTemplate.Replace("{YYYY-MM-DD}", "")

  $prefix = $prefixTemplate
  if ($prefix -notmatch "-$") {
    $prefix += "-"
  }

  $resolvedOutputDir = Join-Path $repoRoot $OutputDir
  $sequence = Get-NextSequence -Directory $resolvedOutputDir -Prefix $prefix
}

$fileName = $resolvedPattern
$fileName = $fileName.Replace("{NNNN}", $sequence)
$fileName = $fileName.Replace("{number}", $sequence)
$fileName = $fileName.Replace("{YYYY-MM-DD}", (Get-Date -Format "yyyy-MM-dd"))

if ($fileName -match "\{.+\}") {
  throw "Unresolved placeholder in filename '$fileName'. Update naming_pattern for doctype '$DocType'."
}

$templatePath = Join-Path $repoRoot $doctypeDef["template"]
$templateContent = Get-FileText -Path $templatePath

$effectiveTitle = $Title
if ([string]::IsNullOrWhiteSpace($effectiveTitle) -and -not [string]::IsNullOrWhiteSpace($resolvedSlug)) {
  $effectiveTitle = ($resolvedSlug -split "-") | ForEach-Object {
    if ($_.Length -gt 0) { $_.Substring(0,1).ToUpperInvariant() + $_.Substring(1) } else { $_ }
  } | Join-String -Separator " "
}

if ($sequence) {
  $templateContent = $templateContent.Replace("{NUMBER}", $sequence)
}

$templateContent = $templateContent.Replace("{TITLE}", $effectiveTitle)
$templateContent = $templateContent.Replace("{CONCERN NAME}", $effectiveTitle)
$templateContent = $templateContent.Replace("{SERVICE NAME}", $effectiveTitle)
$templateContent = $templateContent.Replace("{SERVICE / DOMAIN NAME}", $effectiveTitle)

$templateContent = $templateContent -replace "<!--\s*Draft\s*\\\|\s*Review\s*\\\|\s*Accepted\s*\\\|\s*Deprecated\s*-->", $Status
$templateContent = $templateContent -replace "<!--\s*Draft\s*\\\|\s*Review\s*\\\|\s*Approved\s*\\\|\s*Deprecated\s*-->", $Status

if (-not [string]::IsNullOrWhiteSpace($Owner)) {
  $templateContent = $templateContent -replace "<!--\s*Team or role accountable for this policy\s*-->", $Owner
  $templateContent = $templateContent -replace "<!--\s*Role or team accountable for this service\s*-->", $Owner
  $templateContent = $templateContent -replace "<!--\s*Team or role accountable for this concern\s*-->", $Owner
  $templateContent = $templateContent -replace "<!--\s*Team or role accountable for operations in this domain\s*-->", $Owner
  $templateContent = $templateContent -replace "<!--\s*Role or team responsible for this composition map\s*-->", $Owner
}

$targetDir = Join-Path $repoRoot $OutputDir
if (-not (Test-Path -LiteralPath $targetDir)) {
  New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
}

$targetPath = Join-Path $targetDir $fileName
if (Test-Path -LiteralPath $targetPath) {
  throw "Target file already exists: $targetPath"
}

Set-Content -LiteralPath $targetPath -Value $templateContent -Encoding utf8NoBOM

Write-Host "Created document:" -ForegroundColor Green
Write-Host "  $targetPath"
Write-Host "Using template: $($doctypeDef["template"])"
