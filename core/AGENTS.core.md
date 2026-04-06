# Godot Multi-Agent Workflow Core

This repository defines a portable multi-agent workflow for Godot + GDScript development.

Use this file as the cross-platform baseline for Codex, Cursor, Trae, and other agentic coding tools.
Platform-specific wrappers may add commands, rules, or custom modes, but they should preserve the workflow below.

## Mission

Work like a careful technical lead for a Godot game project.
Prefer small, safe, verifiable progress over large speculative changes.

## Core Workflow

For any non-trivial feature or bugfix:

1. Write a minimal spec first.
2. Identify shared files and conflict risks.
3. Proactively select the most relevant role when the task matches it clearly.
4. Break work into small task packets.
5. Keep the main session as the orchestrator.
6. Only parallelize tasks when file ownership is clearly separated.
7. Validate before claiming success.
8. Keep scope tightly aligned to the user request.

## Role Model

Use these roles when the platform supports agents, subagents, modes, or equivalent prompts:

- `design` for new features, behavior changes, and unclear requests
- `planning` for turning approved designs into file-bounded task packets
- `implementation` for narrow execution tasks with clear file ownership
- `validation` for evidence-driven verification after implementation
- `review` for spec compliance, regression risk, and maintainability checks
- `asset-integration` for art, audio, animation, UI, and resource hookup work that should not change gameplay logic

If the platform does not support native subagents, emulate these roles with:

- dedicated chat threads
- custom modes
- reusable prompts
- documented handoff templates

## Auto-Selection Rules

When the role match is clear, prefer selecting the role automatically instead of waiting for the user to name it.

- New features, unclear requirements, or behavior changes -> `design`
- Approved design that needs task packets -> `planning`
- Narrow, file-bounded implementation -> `implementation`
- After implementation or before claiming success -> `validation`
- Before final completion, or whenever review is requested -> `review`
- Asset hookup without gameplay logic changes -> `asset-integration`

If file ownership is unclear or shared-file integration is involved, keep the work in the main session.

## Godot Risk Model

Treat these as high-risk integration points:

- `project.godot`
- `autoload/*`
- core player scenes
- core player movement and state scripts
- root gameplay scenes
- shared resources referenced by many scenes

Prefer:

- stable node paths
- minimal signal wiring changes
- localized scene edits
- small scripts with focused responsibilities
- additive changes before refactors

Avoid:

- broad scene rewrites
- hidden coupling between player logic and UI
- touching unrelated nodes while editing a scene
- speculative architecture changes

## Task Packet Rules

Each implementation task should:

- have one clear goal
- touch 1-3 strongly related files when possible
- define allowed files
- define forbidden files
- include a quick validation path
- state clear done criteria

If a task needs a shared file unexpectedly, stop and escalate back to the main session.

## Parallelization Rules

Safe to parallelize:

- new independent scripts
- independent UI components
- test scenes
- data resources
- documentation
- asset wiring that does not touch core gameplay logic

Do not parallelize:

- edits to the same `.tscn`
- `project.godot`
- shared `autoload` scripts
- core player controller files
- shared state or event-bus code
- any work with unclear file ownership

When unsure, keep execution serial.

## Validation Standard

Never claim a Godot feature is complete without evidence.

Validation may include:

- headless startup
- scene loading checks
- script parse checks
- targeted gameplay reproduction steps
- log inspection
- acceptance criteria review

Validation should separate:

- confirmed pass or fail
- likely root cause
- unverified suspicion

## Review Standard

Review should prioritize:

- behavior regressions
- spec deviations
- scene and script responsibility drift
- fragile node paths
- broken signals
- missing validation
- maintainability risk

Style-only feedback is secondary.

## Nightly Automation Principle

Nightly automation should be task-file driven, not open-ended.

Use explicit risk modes such as:

- `safe`
- `low-risk`
- `task-packet`

Nightly runs should leave behind a handoff including:

- outcome
- files changed
- validation performed
- open risks
- suggested first step for tomorrow

High-risk shared-file integration stays in the main session, not the nightly runner.
