---
description: Run the Superpowers review flow for Godot work
argument-hint: [feature, fix, or diff to review]
---

Use `superpowers:requesting-code-review` for this Godot review request:

$ARGUMENTS

Use `godot-review-agent` to emphasize Godot-specific review risks:
- node path fragility
- signal wiring risk
- scene and script responsibility drift
- edits outside allowed file scope
- missing validation
- behavior regressions

Output:
- Findings
- Severity
- Why It Matters
- Required Fix or Optional Follow-up
- Residual Risk
