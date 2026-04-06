# Godot AI Workflow Templates

[中文 README](./README.zh-CN.md) | [Quickstart](./docs/quickstart/README.en.md)

Reusable multi-agent workflow templates for Godot development across Claude Code, Codex, Cursor, and Trae.

This repository helps you install a project-local AI workflow into your own Godot game project instead of relying on machine-bound personal setup.

Repository URL:

- `https://github.com/sumo91/godot-ai-workflow-templates`

## Why This Repository Exists

- Bootstrap a practical multi-agent workflow for a new or existing Godot project
- Keep workflow files inside the project so they can be shared across devices and teammates
- Reuse one shared core while adapting to different AI coding tools
- Support nightly task handoff, session organization, review loops, and smoke-test driven setup

## What You Get

- Shared workflow core
- Platform-specific starter templates
- Prompt and handoff templates
- PowerShell and bash installers
- Smoke tests
- Nightly workflow guidance
- Session and thread organization guidance

## Supported Platforms

| Platform | Starter | Primary Guide |
| --- | --- | --- |
| Claude Code | `templates/claude-godot-project` | `docs/platforms/claude.zh-CN.md` |
| Codex | `templates/codex-godot-project` | `docs/platforms/codex.zh-CN.md` |
| Cursor | `templates/cursor-godot-project` | `docs/platforms/cursor.zh-CN.md` |
| Trae | `templates/trae-godot-project` | `docs/platforms/trae.zh-CN.md` |

## Quick Start

1. Pick your platform: `claude`, `codex`, `cursor`, or `trae`
2. Run the installer against your Godot project directory
3. Open the project with your chosen tool
4. Run the matching smoke test before real work

PowerShell example:

```powershell
./installers/powershell/install-workflow.ps1 -Platform codex -ProjectPath D:\Games\MyGodotProject
```

Bash example:

```bash
./installers/bash/install-workflow.sh codex /path/to/MyGodotProject
```

For step-by-step setup:

- English: `docs/quickstart/README.en.md`
- Chinese: `docs/quickstart/README.zh-CN.md`

## Repository Layout

- `core/` shared roles, prompts, and workflow logic
- `templates/` project-local starters for each platform
- `installers/` scripts to copy the right starter into a project
- `docs/` quickstart, concepts, and platform guides
- `smoke-tests/` post-install validation checklists

## Design Principles

- Shared core, thin platform adapters
- Project-local workflow files over machine-bound private configs
- Task-file driven nightly runs
- High-risk Godot integration stays in the main session

## Scope and Non-Goals

This repository does not include:

- private API endpoints
- private auth files
- machine-specific Godot paths
- personal `.codex`, `.claude`, or other tool-home configuration
- a playable game template or sample production project

Those belong in each user's local environment or game repository.

## Documentation

- Quickstart: `docs/quickstart/`
- Platform guides: `docs/platforms/`
- Core concepts: `docs/concepts/`
- Smoke tests: `smoke-tests/`

## Contributing

See `CONTRIBUTING.md` before opening a pull request.

## Community

- `CODE_OF_CONDUCT.md`
- `SECURITY.md`
- `LICENSE`
