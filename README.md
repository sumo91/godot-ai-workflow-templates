# AI Game Workflow Templates

Reusable multi-agent workflow templates for Godot game development across:

- Claude Code
- Codex
- Cursor
- Trae

This repository is designed to be downloaded and applied to your own game project.

## What This Repository Contains

- Shared workflow core
- Platform-specific project starters
- Prompt and handoff templates
- Installer scripts
- Smoke tests
- Nightly workflow guidance

## Quick Start

1. Pick your platform: `claude`, `codex`, `cursor`, or `trae`
2. Run an installer
3. Open your project with your chosen tool
4. Run the matching smoke test

PowerShell example:

```powershell
./installers/powershell/install-workflow.ps1 -Platform codex -ProjectPath D:\Games\MyGodotProject
```

Bash example:

```bash
./installers/bash/install-workflow.sh codex /path/to/MyGodotProject
```

For Chinese quickstart docs:

- `docs/quickstart/README.zh-CN.md`

Platform-specific guides:

- `docs/platforms/claude.zh-CN.md`
- `docs/platforms/codex.zh-CN.md`
- `docs/platforms/cursor.zh-CN.md`
- `docs/platforms/trae.zh-CN.md`

## Contributing

See `CONTRIBUTING.md` before opening a pull request.

## Design Principles

- Shared core, thin platform adapters
- Project-local workflow files over machine-bound private configs
- Task-file driven nightly runs
- High-risk Godot integration stays in the main session

## Repository Layout

- `core/` shared roles and workflows
- `templates/` project starters
- `installers/` starter installation scripts
- `docs/` quickstart and platform guidance
- `smoke-tests/` post-install validation checklists

## Scope

This repository does not include:

- private API endpoints
- private auth files
- machine-specific Godot paths
- personal `.codex` or `.claude` home configuration

Those belong in each user's local environment.
