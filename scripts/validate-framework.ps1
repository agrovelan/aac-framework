Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$errors = [System.Collections.Generic.List[string]]::new()

function Add-ValidationError {
  param([string]$Message)
  $script:errors.Add($Message)
}

function Get-FileText {
  param([string]$Path)
  if (-not (Test-Path -LiteralPath $Path)) {
    Add-ValidationError "Missing file: $Path"
    return ""
  }

  return Get-Content -LiteralPath $Path -Raw
}

function Extract-Block {
  param(
    [string[]]$Lines,
    [int]$StartIndex,
    [string]$StopPattern
  )

  $block = [System.Collections.Generic.List[string]]::new()
  for ($i = $StartIndex; $i -lt $Lines.Count; $i++) {
    if ($Lines[$i] -match $StopPattern) {
      break
    }
    $block.Add($Lines[$i])
  }
  return $block
}

# 1) Basic YAML hygiene checks (dependency-free).
Get-ChildItem -Path $repoRoot -Recurse -File -Include *.yaml, *.yml |
  Where-Object { $_.FullName -notmatch "[\\/]\.git[\\/]" } |
  ForEach-Object {
    $content = Get-FileText -Path $_.FullName
    if ($content -match "`t") {
      Add-ValidationError "YAML file '$($_.FullName)' contains tab indentation. Use spaces only."
    }
  }

# 2) Canonical doctype source must be registry.yaml.
$doctypeConfigPath = Join-Path $repoRoot "doctypes/config.yaml"
$doctypeConfigText = Get-FileText -Path $doctypeConfigPath
$registryFileName = ""
if ($doctypeConfigText -match "(?m)^registry_file:\s*([^\r\n#]+)") {
  $registryFileName = $matches[1].Trim()
}

if ($registryFileName -ne "registry.yaml") {
  Add-ValidationError "doctypes/config.yaml must set registry_file to 'registry.yaml'. Found '$registryFileName'."
}

$registryPath = Join-Path $repoRoot (Join-Path "doctypes" $registryFileName)
$registryText = Get-FileText -Path $registryPath
$registryLines = $registryText -split "`r?`n"

$templateConfigPath = Join-Path $repoRoot "templates/config.yaml"
$templateText = Get-FileText -Path $templateConfigPath
$templateLines = $templateText -split "`r?`n"

$taxonomyPath = Join-Path $repoRoot "labels/taxonomy.yaml"
$taxonomyText = Get-FileText -Path $taxonomyPath

# Parse template index from templates/config.yaml.
$templateIndex = @{}
for ($i = 0; $i -lt $templateLines.Count; $i++) {
  if ($templateLines[$i] -match "^\s{2}-\s+id:\s*([a-z0-9-]+)\s*$") {
    $id = $matches[1]
    $path = ""
    $file = ""

    for ($j = $i + 1; $j -lt $templateLines.Count; $j++) {
      if ($templateLines[$j] -match "^\s{2}-\s+id:") { break }
      if ($templateLines[$j] -match "^\s{4}path:\s*([^\r\n#]+)") { $path = $matches[1].Trim() }
      if ($templateLines[$j] -match "^\s{4}file:\s*([^\r\n#]+)") { $file = $matches[1].Trim() }
    }

    $templateIndex[$id] = @{
      path = $path
      file = $file
    }
  }
}

# Parse label values from labels/taxonomy.yaml.
$statusNames = @{}
$categoryNames = @{}
foreach ($m in [regex]::Matches($taxonomyText, 'name:\s*"status:\s*([a-z-]+)"')) {
  $statusNames[$m.Groups[1].Value] = $true
}
foreach ($m in [regex]::Matches($taxonomyText, 'name:\s*"category:\s*([a-z-]+)"')) {
  $categoryNames[$m.Groups[1].Value] = $true
}

# Parse doctypes from doctypes/registry.yaml.
$doctypeIds = @{}
for ($i = 0; $i -lt $registryLines.Count; $i++) {
  if ($registryLines[$i] -match "^\s{2}-\s+id:\s*([a-z0-9-]+)\s*$") {
    $id = $matches[1]

    if ($doctypeIds.ContainsKey($id)) {
      Add-ValidationError "Duplicate doctype id '$id' in doctypes/registry.yaml."
      continue
    }
    $doctypeIds[$id] = $true

    $block = Extract-Block -Lines $registryLines -StartIndex ($i + 1) -StopPattern "^\s{2}-\s+id:"
    $templatePath = ""
    $namingPattern = ""
    $category = ""
    $statuses = [System.Collections.Generic.List[string]]::new()
    $requiredMetadataCount = 0

    $insideRequiredMetadata = $false
    $insideStatusLabels = $false

    foreach ($line in $block) {
      if ($line -match "^\s{4}template:\s*([^\r\n#]+)") {
        $templatePath = $matches[1].Trim()
      }

      if ($line -match '^\s{4}naming_pattern:\s*"?([^"#\r\n]+)"?') {
        $namingPattern = $matches[1].Trim()
      }

      if ($line -match "^\s{6}category:\s*([^\r\n#]+)") {
        $category = $matches[1].Trim()
      }

      if ($line -match "^\s{4}required_metadata:\s*$") {
        $insideRequiredMetadata = $true
        continue
      }

      if ($insideRequiredMetadata -and $line -match "^\s{6}-\s+") {
        $requiredMetadataCount++
        continue
      }

      if ($insideRequiredMetadata -and $line -notmatch "^\s{6}") {
        $insideRequiredMetadata = $false
      }

      if ($line -match "^\s{6}status:\s*\[(.+)\]") {
        $insideStatusLabels = $false
        $inlineStatuses = $matches[1] -split ","
        foreach ($statusValue in $inlineStatuses) {
          $trimmed = $statusValue.Trim()
          if ($trimmed) { $statuses.Add($trimmed) }
        }
      }
      elseif ($line -match "^\s{6}status:\s*$") {
        $insideStatusLabels = $true
      }
      elseif ($insideStatusLabels -and $line -match "^\s{8}-\s+([a-z-]+)\s*$") {
        $statuses.Add($matches[1])
      }
      elseif ($insideStatusLabels -and $line -notmatch "^\s{8}") {
        $insideStatusLabels = $false
      }
    }

    if ([string]::IsNullOrWhiteSpace($templatePath)) {
      Add-ValidationError "Doctype '$id' is missing template path."
    }
    else {
      $expectedTemplatePath = "templates/$id/template.md"
      if ($templatePath -ne $expectedTemplatePath) {
        Add-ValidationError "Doctype '$id' template path must be '$expectedTemplatePath'. Found '$templatePath'."
      }

      $fullTemplatePath = Join-Path $repoRoot $templatePath
      if (-not (Test-Path -LiteralPath $fullTemplatePath)) {
        Add-ValidationError "Doctype '$id' references missing template file '$templatePath'."
      }
    }

    if ([string]::IsNullOrWhiteSpace($namingPattern)) {
      Add-ValidationError "Doctype '$id' is missing naming_pattern."
    }

    if ($requiredMetadataCount -eq 0) {
      Add-ValidationError "Doctype '$id' must define at least one required_metadata field."
    }

    if ([string]::IsNullOrWhiteSpace($category)) {
      Add-ValidationError "Doctype '$id' is missing labels.category."
    }
    elseif ($categoryNames.Count -gt 0 -and -not $categoryNames.ContainsKey($category)) {
      Add-ValidationError "Doctype '$id' uses unknown labels.category '$category'."
    }

    if ($statuses.Count -eq 0) {
      Add-ValidationError "Doctype '$id' must declare at least one labels.status value."
    }
    else {
      foreach ($status in $statuses) {
        if ($statusNames.Count -gt 0 -and -not $statusNames.ContainsKey($status)) {
          Add-ValidationError "Doctype '$id' uses unknown status label value '$status'."
        }
      }
    }

    if (-not $templateIndex.ContainsKey($id)) {
      Add-ValidationError "Doctype '$id' is missing from templates/config.yaml."
    }
    else {
      $expectedFromTemplateConfig = "templates/$($templateIndex[$id].path)$($templateIndex[$id].file)"
      if ($templatePath -ne $expectedFromTemplateConfig) {
        Add-ValidationError "Doctype '$id' template path mismatch between doctypes/registry.yaml ('$templatePath') and templates/config.yaml ('$expectedFromTemplateConfig')."
      }
    }
  }
}

# 3) Ensure docs point to canonical registry.
$markdownFiles = Get-ChildItem -Path $repoRoot -Recurse -File -Filter *.md
foreach ($md in $markdownFiles) {
  $content = Get-FileText -Path $md.FullName
  if ($content -match "doctypes/doctypes\.yaml" -or $content -match "\./doctypes\.yaml") {
    Add-ValidationError "Markdown file '$($md.FullName)' references doctypes.yaml. Use doctypes/registry.yaml."
  }
}

if ($errors.Count -gt 0) {
  Write-Host "Validation failed with $($errors.Count) error(s):" -ForegroundColor Red
  foreach ($errorText in $errors) {
    Write-Host "  - $errorText" -ForegroundColor Red
  }
  exit 1
}

Write-Host "AAC framework validation passed." -ForegroundColor Green
