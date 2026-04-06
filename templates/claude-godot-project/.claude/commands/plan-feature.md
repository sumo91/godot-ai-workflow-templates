---
description: Turn a Godot feature idea into a low-conflict implementation plan
argument-hint: [feature request]
---

Use `superpowers:brainstorming` and then `superpowers:writing-plans` for this request.
Use the `godot-design-agent` and `godot-planning-agent` to keep the result Godot-specific:

$ARGUMENTS

Requirements:
- First use `superpowers:brainstorming` to write a minimal feature spec or verify that an approved spec already exists.
- Then use `superpowers:writing-plans` to split implementation into small task packets.
- For each task packet, include:
  - Task ID
  - Goal
  - Allowed Files
  - Forbidden Files
  - Expected Changes
  - Dependencies
  - Validation Steps
  - Definition of Done

Also include:
- Shared files
- Parallel-safe tasks
- Serial-only tasks
- Recommended execution order
- Which parts should stay in the main session rather than delegated execution
