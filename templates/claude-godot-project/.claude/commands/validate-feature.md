---
description: Validate a Godot feature or bugfix before completion
argument-hint: [feature or fix]
---

Use `superpowers:verification-before-completion` to validate this Godot work.
Use the `godot-validation-agent` to keep the checks Godot-specific:

$ARGUMENTS

Validation priorities:
- script parse health
- scene loading health
- node path validity
- signal connection validity
- resource reference integrity
- acceptance criteria compliance
- obvious regressions

Output:
- Validation Result: PASS or FAIL
- Verification Gate Status
- Commands or Steps Run
- Evidence
- Likely Root Cause if failing
- Suggested Next Action
