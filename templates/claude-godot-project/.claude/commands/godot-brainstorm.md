---
description: Start the Superpowers brainstorming flow for a Godot feature or design problem
argument-hint: [feature or design request]
---

Use `superpowers:brainstorming` for this Godot request:

$ARGUMENTS

While brainstorming, keep these Godot-specific rules in view:
- The main session remains the orchestrator.
- Treat `.tscn`, `project.godot`, `autoload/*`, and core player scripts as high-risk shared files.
- Favor minimal feature scope, clear scene impact, and explicit acceptance criteria.
- Do not move into implementation until the design is approved.

If helpful, bring in `godot-design-agent` to tighten gameplay, node, input, and acceptance details.

Output:
- Goal
- Feature Summary
- Scene Impact
- Script Impact
- Shared File Risks
- Acceptance Criteria
- Recommended Next Step
