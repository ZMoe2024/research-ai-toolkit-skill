param(
  [string]$DashboardPath = "E:\ai\graduate-agent-skill-dashboard.html",
  [string]$OutputPath = "E:\ai\research-ai-toolkit-skill\references\tool-catalog.json"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path -LiteralPath $DashboardPath)) {
  throw "Dashboard file not found: $DashboardPath"
}

$html = Get-Content -LiteralPath $DashboardPath -Raw
$match = [regex]::Match(
  $html,
  '<script type="application/json" id="embeddedRows">(?<json>.*?)</script>',
  [System.Text.RegularExpressions.RegexOptions]::Singleline
)

if (-not $match.Success) {
  throw "Could not find embeddedRows JSON in $DashboardPath"
}

$rows = $match.Groups["json"].Value | ConvertFrom-Json

$catalog = $rows | ForEach-Object {
  [ordered]@{
    id                   = $_.id
    status               = $_.status
    priority             = $_.priority
    discipline_group     = $_.discipline_group
    discipline           = $_.discipline
    official_disciplines = $_.official_disciplines
    subject_tags         = $_.subject_tags
    research_need        = $_.research_need
    plain_purpose        = $_.plain_purpose
    task_type            = $_.task_type
    source_type          = $_.source_type
    name                 = $_.name
    url                  = $_.url
    codex                = $_.codex
    claude_code          = $_.claude_code
    mcp                  = $_.mcp
    local_software       = $_.local_software
    output               = $_.output
    execution_level      = $_.execution_level
    chinese_friendly     = $_.chinese_friendly
    risk_level           = $_.risk_level
    stars_snapshot       = $_.stars_snapshot
    last_seen            = $_.last_seen
    notes                = $_.notes
    next_action          = $_.next_action
    summary              = $_.summary
  }
}

$outDir = Split-Path -Parent $OutputPath
New-Item -ItemType Directory -Force -Path $outDir | Out-Null
$catalog | ConvertTo-Json -Depth 6 | Set-Content -LiteralPath $OutputPath -Encoding UTF8

Write-Host "Wrote $($catalog.Count) catalog rows to $OutputPath"
