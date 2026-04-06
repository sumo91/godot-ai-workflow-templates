---
description: Run a structured Godot bugfix workflow with separate implementation and validation
argument-hint: [bug description]
---

Use the Godot multi-agent workflow to fix this bug:

$ARGUMENTS

Align with Superpowers by following this sequence:
- `superpowers:systematic-debugging`
- `superpowers:test-driven-development` when practical for the fix
- `superpowers:verification-before-completion`
- `superpowers:requesting-code-review`

Process:
1. Start with `superpowers:systematic-debugging` and gather evidence before changing code.
2. Restate the observed bug clearly.
3. Identify likely affected scenes, scripts, resources, and shared files.
4. Produce a minimal reproduction or validation plan.
5. Create a small task packet for the fix.
6. Use `godot-implementation-agent` to implement the fix only after the likely root cause is clear.
7. Use `godot-validation-agent` and `superpowers:verification-before-completion` to verify the result and check regressions.
8. Use `godot-review-agent` and `superpowers:requesting-code-review` to inspect spec compliance and maintenance risk.

Important:
- Do not bundle unrelated cleanup into the fix.
- If the fix requires touching high-risk shared files, mark that clearly.
- Separate confirmed evidence from speculation.
- Prefer the smallest safe fix.

Output:
- Bug Summary
- Root Cause Status
- Suspected Scope
- Shared File Risks
- Fix Packet
- Validation Result
- Residual Risks
