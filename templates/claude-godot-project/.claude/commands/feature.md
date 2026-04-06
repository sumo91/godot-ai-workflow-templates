---
description: Plan and coordinate a new Godot feature with the multi-agent workflow
argument-hint: [feature request]
---

Use the main session as the orchestrator for this Godot feature.
Align with Superpowers by following this sequence:
- `superpowers:brainstorming`
- `superpowers:writing-plans`
- `superpowers:subagent-driven-development` (recommended) or `superpowers:executing-plans`

Feature request:
$ARGUMENTS

Process:
1. Start with `superpowers:brainstorming` to refine the request into a minimal Godot feature spec.
2. Keep the main session responsible for orchestration and shared-file decisions.
3. Identify shared files and conflict risks.
4. Use `godot-design-agent` if the feature needs clearer gameplay or scene design.
5. After the design is approved, use `superpowers:writing-plans` to produce low-conflict task packets.
6. Decide which tasks can safely run in parallel.
7. Use `superpowers:subagent-driven-development` or `superpowers:executing-plans` for implementation.
8. Use `godot-implementation-agent` only for narrow, file-bounded implementation tasks.
9. Use `godot-validation-agent` for verification and `godot-review-agent` before declaring completion.

Important constraints:
- Treat `.tscn`, `project.godot`, `autoload/*`, and core player scripts as high-risk shared files.
- Default to serial execution when ownership is unclear.
- Keep shared-file integration in the main session.
- Keep scope tightly aligned to the request.
- Do not claim completion without verification.

Output:
- Goal
- Minimal Spec
- Superpowers Stage
- Shared Files
- Task Packets
- Parallelization Decision
- Validation Plan
- Recommended Next Step
