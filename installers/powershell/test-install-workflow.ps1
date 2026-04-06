$ErrorActionPreference = "Stop"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoRoot = Split-Path -Parent (Split-Path -Parent $scriptDir)
$installerPath = Join-Path $scriptDir "install-workflow.ps1"
$tempRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("godot-ai-workflow-test-" + [System.Guid]::NewGuid().ToString("N"))
$projectPath = Join-Path $tempRoot "project"
$expectedFile = Join-Path $projectPath "AGENTS.md"

try {
    New-Item -ItemType Directory -Force -Path $projectPath | Out-Null

    $env:WORKFLOW_INSTALL_PLATFORM = "codex"
    $env:WORKFLOW_INSTALL_PROJECT_PATH = $projectPath

    & $installerPath

    if (-not (Test-Path -LiteralPath $expectedFile)) {
        throw "Expected installed file was not found: $expectedFile"
    }

    Write-Host "PASS: parameterless installer flow installed starter into $projectPath"
}
finally {
    Remove-Item Env:WORKFLOW_INSTALL_PLATFORM -ErrorAction SilentlyContinue
    Remove-Item Env:WORKFLOW_INSTALL_PROJECT_PATH -ErrorAction SilentlyContinue

    if (Test-Path -LiteralPath $tempRoot) {
        Remove-Item -LiteralPath $tempRoot -Recurse -Force
    }
}
