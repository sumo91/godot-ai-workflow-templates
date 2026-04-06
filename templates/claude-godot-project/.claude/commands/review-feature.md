---
description: Review a Godot feature implementation against spec, risk, and maintainability
argument-hint: [what to review]
---

Use `superpowers:requesting-code-review` for this Godot work.
Use the `godot-review-agent` to keep the review focused on Godot-specific risks:

$ARGUMENTS

Review priorities:
- behavior regressions
- deviations from requested functionality
- edits outside intended file scope
- fragile node paths
- signal wiring risk
- missing verification
- maintainability concerns

Report:
- Findings in severity order
- Why each issue matters
- Required fix vs optional follow-up
- Residual risk if no major issue is found
