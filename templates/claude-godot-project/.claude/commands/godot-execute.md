---
description: Execute an existing Godot plan using the Superpowers execution flow
argument-hint: [plan path or task description]
---

Use `superpowers:subagent-driven-development` for this Godot execution request.
If the user explicitly wants inline execution, use `superpowers:executing-plans` instead.

$ARGUMENTS

Execution rules:
- The main session remains the orchestrator.
- Delegate only narrow, file-bounded tasks.
- Keep shared-file integration in the main session.
- Use `godot-implementation-agent` for implementation packets.
- Use `godot-validation-agent` for separate verification.
- Use `godot-review-agent` before claiming a task or feature is complete.

Godot risk model:
- Do not delegate concurrent edits to the same `.tscn`.
- Do not delegate `project.godot`, `autoload/*`, or core player scripts unless the main session explicitly decides to.

Output:
- Execution Mode
- Current Task
- Delegation Plan
- Validation Plan
- Risks
- Next Action
