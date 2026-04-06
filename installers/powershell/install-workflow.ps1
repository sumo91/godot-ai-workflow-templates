param(
    [ValidateSet("claude", "codex", "cursor", "trae")]
    [string]$Platform,

    [string]$ProjectPath,

    [switch]$Force,

    [switch]$Interactive
)

$ErrorActionPreference = "Stop"

function Resolve-Platform {
    param(
        [string]$RequestedPlatform
    )

    $availablePlatforms = @("claude", "codex", "cursor", "trae")

    if ($RequestedPlatform) {
        return $RequestedPlatform.ToLowerInvariant()
    }

    if ($env:WORKFLOW_INSTALL_PLATFORM) {
        $envPlatform = $env:WORKFLOW_INSTALL_PLATFORM.ToLowerInvariant()

        if ($availablePlatforms -notcontains $envPlatform) {
            throw "Invalid WORKFLOW_INSTALL_PLATFORM value: $($env:WORKFLOW_INSTALL_PLATFORM)"
        }

        return $envPlatform
    }

    Write-Host "Select the platform to install:"

    for ($index = 0; $index -lt $availablePlatforms.Count; $index++) {
        Write-Host ("[{0}] {1}" -f ($index + 1), $availablePlatforms[$index])
    }

    while ($true) {
        $selection = (Read-Host "Enter the number or platform name").Trim().ToLowerInvariant()

        if ([string]::IsNullOrWhiteSpace($selection)) {
            continue
        }

        $parsedIndex = 0
        if ([int]::TryParse($selection, [ref]$parsedIndex)) {
            if ($parsedIndex -ge 1 -and $parsedIndex -le $availablePlatforms.Count) {
                return $availablePlatforms[$parsedIndex - 1]
            }
        }

        if ($availablePlatforms -contains $selection) {
            return $selection
        }

        Write-Host "Invalid selection. Choose 1-4 or a platform name."
    }
}

function Resolve-ProjectPath {
    param(
        [string]$RequestedPath
    )

    if ($RequestedPath) {
        return [System.IO.Path]::GetFullPath($RequestedPath)
    }

    if ($env:WORKFLOW_INSTALL_PROJECT_PATH) {
        return [System.IO.Path]::GetFullPath($env:WORKFLOW_INSTALL_PROJECT_PATH)
    }

    $runningOnWindows = $env:OS -eq "Windows_NT"

    if ($runningOnWindows) {
        try {
            Add-Type -AssemblyName System.Windows.Forms -ErrorAction Stop

            $dialog = New-Object System.Windows.Forms.FolderBrowserDialog
            $dialog.Description = "Select your Godot project folder"
            $dialog.ShowNewFolderButton = $false

            if ($dialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
                return [System.IO.Path]::GetFullPath($dialog.SelectedPath)
            }
        }
        catch {
            Write-Host "Folder picker unavailable. Falling back to text input."
        }
    }

    while ($true) {
        $typedPath = (Read-Host "Enter the path to your Godot project").Trim()

        if (-not [string]::IsNullOrWhiteSpace($typedPath)) {
            return [System.IO.Path]::GetFullPath($typedPath)
        }
    }
}

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoRoot = Split-Path -Parent (Split-Path -Parent $scriptDir)
$Platform = Resolve-Platform -RequestedPlatform $Platform
$targetRoot = Resolve-ProjectPath -RequestedPath $ProjectPath
$templateRoot = Join-Path $repoRoot ("templates\" + $Platform + "-godot-project")
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
