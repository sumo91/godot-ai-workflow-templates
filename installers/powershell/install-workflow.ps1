param(
    [Parameter(Mandatory = $true)]
    [ValidateSet("claude", "codex", "cursor", "trae")]
    [string]$Platform,

    [Parameter(Mandatory = $true)]
    [string]$ProjectPath,

    [switch]$Force
)

$ErrorActionPreference = "Stop"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoRoot = Split-Path -Parent (Split-Path -Parent $scriptDir)
$templateRoot = Join-Path $repoRoot ("templates\" + $Platform + "-godot-project")
$targetRoot = [System.IO.Path]::GetFullPath($ProjectPath)
$smokeTestPath = Join-Path $repoRoot ("smoke-tests\" + $Platform + "\README.zh-CN.md")

if (-not (Test-Path -LiteralPath $templateRoot)) {
    throw "Template not found: $templateRoot"
}

if (-not (Test-Path -LiteralPath $targetRoot)) {
    throw "Project path does not exist: $targetRoot"
}

$templateFiles = Get-ChildItem -LiteralPath $templateRoot -Recurse -File

foreach ($file in $templateFiles) {
    $relativePath = $file.FullName.Substring($templateRoot.Length).TrimStart('\')
    $destination = Join-Path $targetRoot $relativePath
    $destinationDir = Split-Path -Parent $destination

    if (-not (Test-Path -LiteralPath $destinationDir)) {
        New-Item -ItemType Directory -Force -Path $destinationDir | Out-Null
    }

    if ((Test-Path -LiteralPath $destination) -and -not $Force) {
        Write-Host "Skip existing file: $relativePath"
        continue
    }

    Copy-Item -LiteralPath $file.FullName -Destination $destination -Force
    Write-Host "Installed: $relativePath"
}

Write-Host ""
Write-Host "Installed $Platform workflow starter into:"
Write-Host $targetRoot
Write-Host ""
Write-Host "Next step:"
Write-Host "Open your project and run the smoke test checklist at:"
Write-Host $smokeTestPath
