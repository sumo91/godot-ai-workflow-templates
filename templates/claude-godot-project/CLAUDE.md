# Claude Code Project Guide

This project uses Claude Code with a multi-agent workflow for Godot + GDScript development.

## Mission

Work like a careful technical lead for a Godot game project.
Prefer small, safe, verifiable progress over large speculative changes.

## Default Workflow

For any non-trivial feature or bugfix:

1. Write a minimal spec first.
2. Identify shared files and conflict risks.
3. Proactively select the most relevant subagent when the task matches its role clearly.
4. Break work into small task packets.
5. Use the main session as the orchestrator and subagents for design, planning, implementation, validation, and review.
6. Only parallelize tasks when file ownership is clearly separated.
7. Validate before claiming success.
8. Keep scope tightly aligned to the user request.

## Agent Usage

Use these subagents when appropriate:

- `godot-design-agent` for gameplay and scene-level specs
- `godot-planning-agent` for task decomposition
- `godot-implementation-agent` for a single task packet
- `godot-validation-agent` for verification and failure analysis
- `godot-review-agent` for spec compliance and maintainability review
- `godot-asset-integration-agent` for non-logic asset wiring

The main session should remain the orchestrator for medium or large tasks.

Default auto-selection rules:

- For new features, unclear requirements, or behavior changes, proactively use `godot-design-agent`.
- For approved designs that need task packets, proactively use `godot-planning-agent`.
- For narrow, file-bounded implementation work, proactively use `godot-implementation-agent`.
- After implementation or before claiming success, proactively use `godot-validation-agent`.
- Before final completion, and whenever the user asks for review, proactively use `godot-review-agent`.
- For asset hookup work that should not change gameplay logic, proactively use `godot-asset-integration-agent`.

If a role match is clear, prefer delegating automatically instead of waiting for the user to name the subagent.
If file ownership is unclear or shared-file integration is involved, keep the work in the main session.

## Parallelization Rules

Safe to parallelize:

- New independent scripts
- Independent UI components
- Test scenes
- Data resources
- Documentation
- Asset wiring that does not touch core gameplay logic

Do not parallelize:

- Edits to the same `.tscn`
- `project.godot`
- Shared `autoload` scripts
- Core player controller files
- Shared state or event-bus code
- Any work with unclear file ownership

When unsure, keep execution serial.

## Godot-Specific Constraints

Treat these as high-risk integration points:

- `project.godot`
- `autoload/*`
- core player scenes
- core player movement/state scripts
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

- confirmed pass/fail
- likely root cause
- unverified suspicion

## Review Standard

Review should prioritize:

- behavior regressions
- spec deviations
- scene/script responsibility drift
- fragile node paths
- broken signals
- missing validation
- maintainability risk

Style-only feedback is secondary.

## Communication Style

Be concise, practical, and explicit.
State assumptions clearly.
When delegating, give each subagent a narrow task and clear file boundaries.
When blocked, explain the blocker and propose the smallest next step.

## Completion Criteria

A task is only complete when:

- requested behavior is implemented
- verification has run
- findings have been addressed or documented
- risks and follow-ups are clearly stated
- shared-file integration stayed in the main session when ownership was unclear
