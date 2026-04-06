# Quick Start

This repository helps you install a reusable Godot multi-agent workflow into your own project.

## Start In 3 Steps

1. Pick a platform: `Claude`, `Codex`, `Cursor`, or `Trae`
2. Run an installer to copy the matching starter into your project
3. Open the project and run the platform smoke test

PowerShell example:

```powershell
./installers/powershell/install-workflow.ps1 -Platform codex -ProjectPath D:\Games\MyGodotProject
```

Bash example:

```bash
./installers/bash/install-workflow.sh codex /path/to/MyGodotProject
```

## Important Boundary

This repository does not ship private machine-bound config such as:

- private API endpoints
- auth files
- local Godot executable paths
- personal tool home directories
