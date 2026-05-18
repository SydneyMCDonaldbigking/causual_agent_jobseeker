param(
    [string]$Destination = "$HOME\.hermes-jobseeker-skills"
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)

New-Item -ItemType Directory -Path $Destination -Force | Out-Null

foreach ($name in @("skills", "examples")) {
    $source = Join-Path $repoRoot $name
    $target = Join-Path $Destination $name

    if (Test-Path $target) {
        Remove-Item -LiteralPath $target -Recurse -Force
    }

    Copy-Item -Path $source -Destination $target -Recurse -Force
}

Write-Host "Installed Hermes jobseeker skills to $Destination"
