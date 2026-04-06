---
description: Run the Superpowers debugging workflow for a Godot issue
argument-hint: [bug or failure description]
---

Use `superpowers:systematic-debugging` for this Godot issue:

$ARGUMENTS

Use `godot-validation-agent` to help collect evidence and confirm whether failures are script, scene, resource, or behavior related.

Rules:
- Establish reproduction steps first.
- Distinguish confirmed evidence from hypotheses.
- Do not jump into implementation until the likely root cause is clear.
- If a fix is made, finish with `superpowers:verification-before-completion`.

Output:
- Bug Summary
- Reproduction Status
- Evidence
- Likely Root Cause
- Fix Recommendation
- Verification Plan
