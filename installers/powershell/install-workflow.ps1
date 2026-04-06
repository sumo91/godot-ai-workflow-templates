param(
    [ValidateSet("claude", "codex", "cursor", "trae", "opencode")]
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

    $availablePlatforms = @("claude", "codex", "cursor", "trae", "opencode")

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

        Write-Host "Invalid selection. Choose 1-5 or a platform name."
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

function Resolve-OverwriteMode {
    param(
        [switch]$CliForce
    )

    if ($CliForce) {
        return "overwrite"
    }

    if ($env:WORKFLOW_INSTALL_OVERWRITE) {
        $envOverwrite = $env:WORKFLOW_INSTALL_OVERWRITE.Trim().ToLowerInvariant()

        switch ($envOverwrite) {
            { $_ -in @("overwrite", "force", "yes", "y", "true", "1") } { return "overwrite" }
            { $_ -in @("skip", "no", "n", "false", "0") } { return "skip" }
            default { throw "Invalid WORKFLOW_INSTALL_OVERWRITE value: $($env:WORKFLOW_INSTALL_OVERWRITE)" }
        }
    }

    $canPrompt = [Environment]::UserInteractive -and -not [Console]::IsInputRedirected

    if ($canPrompt -and ($Interactive -or (-not $PSBoundParameters.ContainsKey('Platform') -and -not $PSBoundParameters.ContainsKey('ProjectPath')))) {
        while ($true) {
            $selection = (Read-Host "Overwrite existing files when they already exist? [y/N]").Trim().ToLowerInvariant()

            switch ($selection) {
                "y" { return "overwrite" }
                "yes" { return "overwrite" }
                "" { return "skip" }
                "n" { return "skip" }
                "no" { return "skip" }
            }
        }
    }

    return "skip"
}

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoRoot = Split-Path -Parent (Split-Path -Parent $scriptDir)
$Platform = Resolve-Platform -RequestedPlatform $Platform
$targetRoot = Resolve-ProjectPath -RequestedPath $ProjectPath
$overwriteMode = Resolve-OverwriteMode -CliForce:$Force
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

    if ((Test-Path -LiteralPath $destination) -and $overwriteMode -ne "overwrite") {
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
