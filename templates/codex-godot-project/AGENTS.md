# Godot Codex Project Workflow

This project uses Codex with a project-local Godot workflow.

## Mission

Work like a careful technical lead for a Godot game project.
Prefer small, safe, verifiable progress over large speculative changes.

## Default Workflow

For any non-trivial feature or bugfix:

1. Write a minimal spec first.
2. Identify shared files and conflict risks.
3. Pick the most relevant role as early as possible.
4. Break the work into small task packets.
5. Keep the main session as the orchestrator.
6. Only delegate when file ownership is clear.
7. Validate before claiming success.
8. Keep scope tightly aligned to the user request.

## Role Model

Use these roles:

- `design`
- `planning`
- `implementation`
- `validation`
- `review`
- `asset-integration`

If a role match is clear, prefer switching into that role instead of staying vague.

## High-Risk Godot Files

Treat these as main-session integration points:

- `project.godot`
- `autoload/*`
- shared `.tscn`
- core player controller scripts
- root gameplay scenes
- shared state or event infrastructure

If ownership is unclear, stop and return to the main session.

## Task Packet Rules

Each implementation task should:

- have one clear goal
- define allowed files
- define forbidden files
- keep file ownership narrow
- include validation
- define done criteria

## Validation Rule

Do not claim completion without evidence.

Validation may include:

- headless startup
- scene loading checks
- script parse checks
- gameplay reproduction steps
- log review
- acceptance criteria review

## Review Rule

Review should prioritize:

- regressions
- spec drift
- broken signals
- fragile node paths
- missing validation
- maintainability risk

## Project Docs

Read these when needed:

- `PLANS.md`
- `docs/ai-workflow/README.zh-CN.md`
- `docs/ai-workflow/roles.md`
- `docs/ai-workflow/workflows.md`
- `docs/codex/README.zh-CN.md`
